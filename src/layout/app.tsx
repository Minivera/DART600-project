/** @jsx jsx */
import React, { useMemo } from 'react';
import { jsx, Theme, ThemeProvider } from '@emotion/react';
import { DndProvider } from 'react-dnd';
import { HTML5Backend } from 'react-dnd-html5-backend';
import { Story } from 'inkjs/engine/Story';

import { Game } from '../game/game';
import { theme } from '../theme';

import storyContent from '../../data/bears.json?raw';

interface StoryThemeVariables {
  primary_color?: string;
  primary_dark_color?: string;
  primary_light_color?: string;
  secondary_color?: string;
  secondary_dark_color?: string;
  secondary_light_color?: string;
  red_color?: string;
  text_color?: string;
  link_color?: string;
}

export const App: React.FunctionComponent = () => {
  const story = useMemo<Story>(
    () =>
      // JSON has invalid char at index 0 for some reason
      new Story(storyContent.slice(1)),
    [storyContent]
  );

  const variables = story.variablesState as unknown as StoryThemeVariables;

  const overriddenTheme: Theme = {
    colors: {
      primary: variables.primary_color || theme.colors.primary,
      primaryDark: variables.primary_dark_color || theme.colors.primaryDark,
      primaryLight: variables.primary_light_color || theme.colors.primaryLight,
      secondary: variables.secondary_color || theme.colors.secondary,
      secondaryDark: variables.secondary_dark_color || theme.colors.secondaryDark,
      secondaryLight: variables.secondary_light_color || theme.colors.secondaryLight,
      text: variables.text_color || theme.colors.text,
      red: variables.red_color || theme.colors.red,
      link: variables.link_color || theme.colors.link,
    }
  };

  return (
    <DndProvider backend={HTML5Backend}>
      <ThemeProvider theme={overriddenTheme}>
        <Game storyContent={story} />
      </ThemeProvider>
    </DndProvider>
  );
};
