import { useEffect, useState, useMemo } from 'react';
import { Story } from 'inkjs/engine/Story';

import { Game } from './game';
import { extractTags } from './tags';

const localstorageSaveKey = 'game-save';

export enum GameState {
  // eslint-disable-next-line no-unused-vars
  Ready = 'ready',
  // eslint-disable-next-line no-unused-vars
  Loaded = 'loaded',
  // eslint-disable-next-line no-unused-vars
  Started = 'started',
  // eslint-disable-next-line no-unused-vars
  Ended = 'ended',
}

export interface Clue {
  clueId: number;
  text: string;
  question?: string;
  isResetButton?: boolean;
  isRefreshButton?: boolean;
}

export interface Question {
  question: string;
  cluesNeeded: number;
  selectedClues: [string, string][];
  feedback?: string;
  answer?: string;
}

export interface Game {
  state: GameState;
  storyText: string[];
  feedback?: string;
  clues: Clue[];
  oldQuestions: Question[];
  currentQuestion?: Question;
  playingStory?: boolean;
  realWorldStory?: boolean;
}

export type GameAction =
  | { type: 'start' }
  | { type: 'end' }
  | { type: 'continue'; choiceId?: number }
  | { type: 'click_clue'; clueName: string }
  | { type: 'save_game' };

const processQuestion = (
  result: string,
  story: Story
): {
  question: Question;
  oldQuestion?: Question;
  nextStory?: string;
  clues: Clue[];
} => {
  let question: Question = {
    cluesNeeded: 0,
    selectedClues: [],
    question: result,
  };
  let oldQuestion: Question | undefined;
  let clues: Clue[] = [];

  const tags = story.currentTags;

  // Extract the tags using our own custom format
  const extracted = extractTags(tags);

  // Get the number of needed clue
  question.cluesNeeded =
    typeof extracted['needs'] === 'string'
      ? 1
      : (extracted['needs'] as string[]).length;

  // When hitting a question, continue the story to also hit the selected clues and the known clues
  let selectedClues = false;
  while (story.canContinue) {
    let next = story.Continue();
    if (!selectedClues && story.currentTags?.includes('clues_start')) {
      clues = story.currentChoices.map(choice => {
        const textParts = choice.text.split('--');
        if (textParts.length > 1) {
          return {
            clueId: choice.index,
            text: textParts[0].trim(),
            question: textParts[1].trim(),
          };
        } else if (choice.text.toLowerCase().startsWith('refresh')) {
          return {
            clueId: choice.index,
            text: choice.text.trim(),
            isRefreshButton: true,
          };
        }

        return {
          clueId: choice.index,
          text: choice.text.trim(),
          isResetButton: true,
        };
      });
    } else if (story.currentTags?.includes('selected_end')) {
      // Also add as a result if this tag contains a result
      if (next && story.currentTags?.includes('result')) {
        question.feedback = next;
      } else if (next && story.currentTags?.includes('result good_result')) {
        question.answer = next;
      }

      selectedClues = false;
    } else if (selectedClues || story.currentTags?.includes('selected_start')) {
      selectedClues = true;
      if (!next || next.toLowerCase().startsWith('selected clues:')) {
        // Skip the storyboard helpers or if we got no content
        continue;
      }

      const textParts = next.split('--');
      question.selectedClues.push([textParts[0].trim(), textParts[1].trim()]);
    } else if (next && story.currentTags?.includes('question')) {
      // If we suddenly hit a new question, get it started
      const { question: newQuestion, clues: newClues } = processQuestion(
        next,
        story
      );

      oldQuestion = question;
      question = newQuestion;
      clues = newClues;
    } else if (next && story.currentTags?.includes('story_start')) {
      // If we suddenly hit the real world story, return that
      return { question, oldQuestion, clues, nextStory: next };
    }
  }

  return { question, oldQuestion, clues };
};

export const useGame = (
  storyContent: string
): [Game, Story, (action: GameAction) => void] => {
  const [state, setState] = useState<Game>({
    state: GameState.Ready,
    storyText: [],
    clues: [],
    oldQuestions: [],
  });

  const story = useMemo<Story>(
    () =>
      // JSON has invalid char at index 0 for some reason
      new Story(storyContent.slice(1)),
    [storyContent]
  );

  const dispatch = (action: GameAction): void => {
    switch (action.type) {
      case 'start': {
        // Ready means we haven't started the game, we need to boot it up and
        // get ready to show content.
        if (state.state === GameState.Ready && story.canContinue) {
          // Run the story for the first time if we've only loaded the content
          const result = story.Continue();

          if (!result) {
            return;
          }

          setState(state => ({
            ...state,
            state: GameState.Started,
            storyText: story.currentTags?.includes('story_start')
              ? state.storyText.concat(result)
              : state.storyText,
            playingStory: story.currentTags?.includes('story_start'),
          }));
          return;
        }

        // If not ready, then we have a save already going. Set the game to started.
        setState(state => ({
          ...state,
          state: GameState.Started,
        }));
        break;
      }
      case 'end': {
        setState(state => ({
          ...state,
          state: GameState.Ended,
        }));
        break;
      }
      case 'continue': {
        if (typeof action.choiceId !== 'undefined') {
          story.ChooseChoiceIndex(action.choiceId);
        }

        if (!story.canContinue) {
          return;
        }

        let result = story.Continue();
        console.log(result);
        console.log(story.currentTags);

        if (!result) {
          return;
        }

        let playingStory = state.playingStory;
        let storyText = state.storyText;
        let clues = state.clues;
        let question: Question | undefined = undefined;
        let oldQuestion: Question | undefined = undefined;
        let resultFeedback: string | undefined = undefined;
        let realWorldStory = state.realWorldStory;

        if (story.currentTags?.includes('story_start')) {
          playingStory = true;
          storyText = [];
        } else if (story.currentTags?.includes('story_end')) {
          playingStory = false;
        }

        if (story.currentTags?.includes('question')) {
          const processed = processQuestion(result, story);

          question = processed.question;
          oldQuestion = processed.oldQuestion;
          clues = processed.clues;

          if (processed.nextStory) {
            result = null;
            playingStory = true;
            storyText = [processed.nextStory];
            realWorldStory = true;
          }
        } else if (story.currentTags?.includes('result')) {
          resultFeedback = result;
        }

        setState(state => ({
          ...state,
          playingStory,
          clues,
          storyText:
            playingStory && result ? storyText.concat(result) : storyText,
          oldQuestions: state.oldQuestions.concat(
            oldQuestion && !state.oldQuestions.includes(oldQuestion)
              ? [oldQuestion]
              : []
          ),
          currentQuestion: question,
          feedback: resultFeedback,
          realWorldStory,
        }));
        break;
      }
      case 'click_clue': {
        (story.variablesState as unknown as Record<string, unknown>)[
          `${action.clueName}_activated`
        ] = true;
        (story.variablesState as unknown as Record<string, unknown>)[
          'at_least_one_activated_clue'
        ] = true;

        if (state.currentQuestion) {
          dispatch({
            type: 'continue',
            choiceId: state.clues.find(clue => clue.isRefreshButton)?.clueId,
          });
        }
        break;
      }
      case 'save_game': {
        localStorage.setItem(localstorageSaveKey, story.state.toJson());

        setState(state => ({
          ...state,
        }));
        break;
      }
      default:
        return;
    }
  };

  useEffect(() => {
    const localSave = localStorage.getItem(localstorageSaveKey);
    if (localSave) {
      story.state.LoadJson(localSave);
      setState(state => ({
        ...state,
        state: GameState.Loaded,
      }));
    } else {
      setState(state => ({
        ...state,
        state: GameState.Ready,
      }));
    }
  }, []);

  return [state, story, dispatch];
};
