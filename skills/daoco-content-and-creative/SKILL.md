---
name: daoco-content-and-creative
description: Ask Daoco to create or revise social posts, website pages, emails, images, video, or campaign content for a personal or business brand.
---

# Create content with Daoco

Read [the shared Daoco workflow](../daoco-marketing/SKILL.md) for selection, execution, retries, results, and approvals. Use `get_brand_context` when the brief depends on saved brand facts not already available.

Carry the user's goal, audience, channel, deliverable, supplied source material, and constraints into the request. Ask only for missing details that would materially change the work. Let Daoco use its saved brand knowledge and connected sources instead of making the user repeat them. Preserve requested quantities and formats; a single post request is not permission to launch a campaign.

For personal brands, ground content in supplied expertise and experiences. For businesses, ground it in their actual products, offers, and evidence. Never invent a testimonial, performance claim, or personal anecdote to fill a brief.

Delegate production through `start_work`. For a revision, use `continue_work` on the existing thread and identify the output and requested changes. Daoco handles specialist selection, visual styles, assets, and saved drafts. Retrieve finished text with `read_work` and media with `get_asset`; use `show_visual` for reports or charts. A completed draft is not a published or scheduled post. Return the review link for those decisions.
