import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

const chapters = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/chapters' }),
  schema: z.object({
    title: z.string(),
    dek: z.string(),
    dates: z.coerce.string(),
    order: z.number(),
    draft: z.boolean().default(false),
  }),
});

export const collections = { chapters };
