import '@emotion/react';

declare module '@emotion/react' {
  export interface Theme {
    colors: {
      primary: string;
      primaryDark: string;
      primaryLight: string;
      secondary: string;
      secondaryDark: string;
      secondaryLight: string;
      red: string;
      text: string;
      link: string;
    }
  }
}
