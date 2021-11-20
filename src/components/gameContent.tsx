/** @jsx jsx */
import React, {
  FunctionComponent,
  KeyboardEventHandler,
  useEffect,
  useRef,
} from 'react';
import { css, jsx } from '@emotion/react';
import { Story } from 'inkjs/engine/Story';
import { darken, transparentize } from 'polished';

import { Clue, Game } from '../game/gameState';
import { GameQuestion } from './gameQuestion';
import { GameClues } from './gameClues';
import { GameAnswers } from './gameAnswers';

export interface GameContentProps {
  gameState: Game;
  story: Story;
  onClueClicked: (clueName: string) => void;
  onClueSelected: (clue: Clue) => void;
  onContinue: () => void;
}

export const GameContent: FunctionComponent<GameContentProps> = ({
  gameState,
  story,
  onClueClicked,
  onClueSelected,
  onContinue,
}) => {
  const toScrollRef = useRef<HTMLParagraphElement>(null);

  useEffect(() => {
    if (toScrollRef.current) {
      toScrollRef.current.scrollIntoView({ behavior: 'smooth' });
    }
  }, [gameState.storyText]);

  const extractionRegex = /(.*)\[([^\\]+)@([^\]]+)](.*)/m;
  const convertText = (text: string, index: number): React.ReactElement[] => {
    let match = text.match(extractionRegex);
    if (!match) {
      return [<span key={index}>{text}</span>];
    }

    const clueName: string = match[3];
    return [
      ...convertText(match[1], index + 1),
      <a
        key={`${index}_2`}
        onClick={() => onClueClicked(clueName)}
        css={theme => css`
          text-decoration: underline;
          cursor: pointer;
          color: ${theme.colors.link};
          font-weight: bold;
          text-transform: uppercase;

          &:hover {
            color: ${darken(0.2, theme.colors.link)};
          }
        `}
      >
        {match[2]}
      </a>,
      <span key={`${index}_3`}>{match[4]}</span>,
    ];
  };

  const handleKeyContinue: KeyboardEventHandler<HTMLDivElement> = event => {
    if (['Right', 'ArrowRight', 'Enter', 'Spacebar', ' '].includes(event.key)) {
      onContinue();
    }
  };

  return (
    <div
      css={css`
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
      `}
    >
      <div
        onKeyDown={handleKeyContinue}
        tabIndex={-1}
        css={css`
          width: 720px;
          margin-top: 2rem;
          margin-bottom: 2rem;
        `}
      >
        <h2
          css={theme => css`
            display: flex;
            justify-content: center;
            padding-top: 0.5rem;
            padding-bottom: 0.5rem;
            text-transform: uppercase;
            background-color: ${transparentize(0.4, theme.colors.primary)};
            border-color: ${darken(0.2, theme.colors.primaryDark)};
            border-width: 0.5rem;
            border-top-style: solid;
            border-bottom-style: solid;
            align-self: stretch;
          `}
        >
          {gameState.realWorldStory ? 'Real world story' : 'Story'}
        </h2>
        {gameState.storyText.map((text, index) => (
          <p
            key={index}
            ref={
              index + 1 === gameState.storyText.length ? toScrollRef : undefined
            }
            css={theme => css`
              padding: 1rem;
              color: ${darken(0.5, theme.colors.primaryDark)};
              background-color: ${transparentize(0.4, theme.colors.primary)};
              border-radius: 5px;
              box-shadow: 0 0 0.2rem 0.1rem ${theme.colors.text};
            `}
          >
            {convertText(text, index)}
          </p>
        ))}
        {story.canContinue && (
          <button
            css={theme => css`
              padding: 0.5rem;
              color: inherit;
              font-family: inherit;
              cursor: pointer;
              font-size: inherit;
              width: 100%;
              border: 0.2rem solid ${theme.colors.primaryDark};
              background: none;

              &:hover {
                color: ${darken(0.5, theme.colors.primaryDark)};
                background-color: ${transparentize(0.4, theme.colors.primary)};
              }
            `}
            onClick={onContinue}
          >
            Press "Space" or click to continue
          </button>
        )}
      </div>
      {gameState.currentQuestion && (
        <React.Fragment>
          <GameQuestion question={gameState.currentQuestion} />
          <GameClues clues={gameState.clues} onClueSelected={onClueSelected} />
        </React.Fragment>
      )}
      <GameAnswers questions={gameState.oldQuestions} />
    </div>
  );
};
