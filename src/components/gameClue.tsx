/** @jsx jsx */
import { FunctionComponent } from 'react';
import { css, jsx } from '@emotion/react';
import { darken, transparentize } from 'polished';
import { useDrag } from 'react-dnd';

import { Clue } from '../game/gameState';

export interface GameClueProps {
  clue: Clue;
  onClueSelected: (clue: Clue) => void;
}

export const GameClue: FunctionComponent<GameClueProps> = ({
  clue,
  onClueSelected,
}) => {
  const [{ isDragging }, drag] = useDrag(() => ({
    type: 'clue',
    collect: monitor => ({
      isDragging: monitor.isDragging(),
    }),
    item: {
      clue,
    },
    end: (item, monitor) => {
      if (monitor.didDrop()) {
        onClueSelected(item.clue);
      }
    },
  }));

  return (
    <div
      css={theme => css`
        ${isDragging ? 'opacity: 0.7;' : ''}

        min-width: 20rem;
        margin: 1rem;
        color: ${darken(0.5, theme.colors.primaryDark)};
        background-color: ${transparentize(0.4, theme.colors.primary)};
        border-radius: 15px;
        height: 15rem;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        padding: 0.5rem;
        box-shadow: 0 0 0.2rem 0.1rem ${theme.colors.text};
        cursor: pointer;

        &:hover {
          box-shadow: 0 0 0.4rem 0.1rem ${theme.colors.text};
        }
      `}
      ref={drag}
      /* onClick={() => onClueSelected(clue)} */
    >
      <p
        css={css`
          font-size: 1.1rem;
          margin-bottom: 0.5rem;
        `}
        dangerouslySetInnerHTML={{ __html: clue.text }}
      />
      <p
        css={css`
          font-style: italic;
          margin-top: 0.5rem;
        `}
      >
        {clue.question}
      </p>
    </div>
  );
};
