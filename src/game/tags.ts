export const extractTags = (tags: string[] | null): Record<string, string | string[] | boolean> => {
  if (!tags) {
    return {};
  }

  const processedTags: Record<string, string | string[] | boolean> = {};

  tags.forEach(element => {
    element.split(' ').forEach(part => {
      const subparts = part.split('=');
      if (subparts.length <= 1) {
        processedTags[subparts[0].trim()] = true;
        return;
      }


      if (subparts[1].includes(',')) {
        processedTags[subparts[0].trim()] = subparts[1].trim().split(',').map(el => el.trim());
      } else {
        processedTags[subparts[0].trim()] = subparts[1].trim();
      }
    });
  });

  return processedTags;
};
