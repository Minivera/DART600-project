/** @jsx jsx */
import { FunctionComponent } from 'react';
import { css, jsx } from '@emotion/react';
import { darken, transparentize } from 'polished';

import { Clue } from '../game/gameState';
import { GameClue } from './gameClue';

export interface GameCluesProps {
  clues: Clue[];
  onClueSelected: (clue: Clue) => void;
}

export const GameClues: FunctionComponent<GameCluesProps> = ({
  clues,
  onClueSelected,
}) => {
  const resetButtonClue = clues.find(clue => clue.isResetButton);
  const validClues = clues.filter(
    clue => !clue.isRefreshButton && !clue.isResetButton
  );

  return (
    <div
      css={css`
        width: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
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
        Clues
      </h2>
      {validClues.length ? (
        <div
          css={css`
            width: 100%;
            overflow-x: auto;
            overflow-y: hidden;
          `}
        >
          <div
            css={css`
              display: flex;
              padding: 0 2rem;
            `}
          >
            {validClues.map(clue => (
              <GameClue key={clue.clueId} clue={clue} onClueSelected={onClueSelected} />
            ))}
          </div>
        </div>
      ) : (
        <div
          css={theme => css`
            display: flex;
            align-items: center;
            justify-content: center;
            text-transform: uppercase;
            font-size: 1.2rem;
            color: ${transparentize(0.2, theme.colors.text)};
          `}
        >
          You still need to find a clue in the story
        </div>
      )}
      {resetButtonClue && (
        <div
          css={css`
            margin: 2rem;
            width: 720px;
            justify-self: center;
          `}
        >
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
            onClick={() => onClueSelected(resetButtonClue)}
          >
            {resetButtonClue.text}
          </button>
        </div>
      )}
    </div>
  );
};
