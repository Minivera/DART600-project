/** @jsx jsx */
import React from 'react';
import { css, jsx, Global } from '@emotion/react';

import { Clue, GameState, useGame } from './gameState';
import { GameContent } from '../components/gameContent';
import { darken, transparentize } from 'polished';

export interface GameProps {
  storyContent: string;
}

export const Game: React.FunctionComponent<GameProps> = ({ storyContent }) => {
  const [gameState, story, dispatch] = useGame(storyContent);

  const globalStyles = (
    <Global
      styles={theme => css`
        :root {
          color: ${theme.colors.text};
          font-family: Arial;
          font-size: 16px;
        }

        body {
          background-color: ${theme.colors.secondaryLight};
        }

        p {
          text-align: justify;
        }
      `}
    />
  );

  switch (gameState.state) {
    case GameState.Ready:
    case GameState.Loaded:
      return (
        <div
          css={css`
            display: flex;
            align-items: center;
            justify-content: center;
          `}
        >
          {globalStyles}
          <div
            css={css`
              margin: 2rem;
              width: 720px;
            `}
          >
            <h1>
              Learning tabletop games - Prototype
            </h1>
            <p>
              To play the game, read the story and select the clues from the story, they are highlighted.
              After the story is completed, you will be shown a series of questions to answer.
              </p>
            <p>
              Each question has a number of clues that need to be assigned to answer it. The question gives you
              some pointers as to which clues should be assigned to this question. Drag the clues in the list
              at the bottom of the page and drop them in the clue slots bellow the question to select them.
            </p>
            <p>
              If you get things wrong, the selected clues will glow red. Click the reset button bellow the
              list of clues to reset the question and try again. If you can't find the correct clues, read them
              again and try reading the story again to get more context.
            </p>
            <button
              onClick={() => dispatch({ type: 'start' })}
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
                  background-color: ${transparentize(
                    0.4,
                    theme.colors.primary
                  )};
                }
              `}
            >
              Start game
            </button>
          </div>
        </div>
      );
    case GameState.Started: {
      const onContinue = () => {
        if (!story.canContinue) {
          return;
        }

        dispatch({ type: 'continue' });
      };

      const onClueClicked = (clueName: string) => {
        dispatch({ type: 'click_clue', clueName });
      };

      const onClueSelected = (clue: Clue) => {
        dispatch({ type: 'continue', choiceId: clue.clueId });
      };

      return (
        <React.Fragment>
          {globalStyles}
          <GameContent
            gameState={gameState}
            story={story}
            onClueClicked={onClueClicked}
            onClueSelected={onClueSelected}
            onContinue={onContinue}
          />
        </React.Fragment>
      );
    }
  }

  return <div>Unknown state</div>;
};
