/** @jsx jsx */
import React, { FunctionComponent } from 'react';
import { css, jsx } from '@emotion/react';
import { darken, transparentize } from 'polished';

import { Question } from '../game/gameState';

export interface GameAnswersProps {
  questions: Question[];
}

export const GameAnswers: FunctionComponent<GameAnswersProps> = ({
  questions,
}) =>
  questions.length ? (
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
        Found answers
      </h2>
      <div
        css={css`
          width: 720px;
          display: flex;
          align-items: center;
          flex-direction: column-reverse;
        `}
      >
        {questions.map(question => (
          <div
            key={question.question}
            css={theme => css`
              margin: 1rem;
              color: ${darken(0.5, theme.colors.primaryDark)};
              background-color: ${transparentize(0.4, theme.colors.primary)};
              border-radius: 15px;
              padding: 0;
              overflow: hidden;
              box-shadow: 0 0 0.2rem 0.1rem ${theme.colors.text};
            `}
          >
            <p
              css={theme => css`
                margin-top: 0;
                padding: 0.5rem;
                background-color: ${darken(0.4, theme.colors.primaryDark)};
                color: ${theme.colors.secondaryLight};
                font-size: 1.2rem;
              `}
            >
              {question.question}
            </p>
            {question.answer && (
              <React.Fragment>
                <p
                  css={css`
                    padding: 0.5rem 0.5rem 0;
                  `}
                >
                  Answer:
                </p>
                <p
                  css={css`
                    padding: 0 0.5rem 0.5rem;
                  `}
                >
                  {question.answer}
                </p>
              </React.Fragment>
            )}
          </div>
        ))}
      </div>
    </div>
  ) : null;
