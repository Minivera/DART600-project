declare module '*.svg?w=350' {
  const path: string;
  export default path;
}

declare module '*.svg?component' {
  import * as React from 'react';

  const ReactComponent: React.FunctionComponent<
    React.SVGProps<SVGSVGElement> & { title?: string }
  >;

  export default ReactComponent;
}

declare module '*.jpg?w=1920&h=1024' {
  const path: string;
  export default path;
}

declare module '*.png?w=1920&h=1024' {
  const path: string;
  export default path;
}

declare module '*.png' {
  const path: string;
  export default path;
}

declare module '*.ttf' {
  const path: string;
  export default path;
}

declare module '*.mp3' {
  const path: string;
  export default path;
}

declare module '*.mp4' {
  const path: string;
  export default path;
}

declare module '*.json?raw' {
  const content: string;
  export default content;
}

declare module '*.pdf' {
  const path: string;
  export default path;
}

interface ImportMeta {
  glob<T, E extends Record<string, unknown> = Record<string, unknown>>(
    path: string
  ): Record<string, () => Promise<{ default: T } & E>>;
}
