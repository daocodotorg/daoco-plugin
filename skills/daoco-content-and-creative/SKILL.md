---
name: daoco-content-and-creative
description: Ask Daoco to create or revise social posts, website pages, emails, images, video, or campaign content for a personal or business brand.
---

# Create content with Daoco

Read [the shared Daoco workflow](../daoco-marketing/SKILL.md) for selection, execution, retries, results, and approvals. Use `get_brand_context` when the brief depends on saved brand facts not already available.

Carry the user's goal, audience, channel, deliverable, supplied source material, and constraints into the request. Ask only for missing details that would materially change the work. Let Daoco use its saved brand knowledge and connected sources instead of making the user repeat them. Preserve requested quantities and formats; a single post request is not permission to launch a campaign.

For personal brands, ground content in supplied expertise and experiences. A point-of-view or story post needs the person's own opinion or experience; when the request and saved context have none, `/pov` with the topic asks the person what they believe and what happened, then writes from their answers. Pass the person's answers back through `continue_work` in their words. For businesses, ground it in their actual products, offers, and evidence. Never invent a testimonial, performance claim, or personal anecdote to fill a brief.

Delegate production through `start_work`. For a revision, use `continue_work` on the existing thread and identify the output and requested changes. Daoco handles specialist selection, visual styles, assets, and saved drafts. Retrieve finished text with `read_work` and images, videos, charts, or reports with `get_output`. `list_work` with `view: "drafts"` lists saved post drafts. A completed draft is not a published or scheduled post. Return the review link for those decisions.

## Brief the actual deliverable

Use the relevant guidance below when it fits the user's request. Carry explicit constraints into the brief; do not turn these into extra mandatory questions or silently enlarge the task.

- A batch of posts needs the requested count, destinations, and any theme or dates. Keep copy, creative concepts, generated media, and saved drafts distinct. If the user asks for complete posts, an outline is not completion.
- Repurposing needs the source material and intended destinations. Preserve the source's claims and core idea while requesting native openings, length, structure, and calls to action for each platform. Do not ask for identical copy pasted everywhere.
- A page needs its reader, purpose, and any source or search intent the user supplied. Preserve the requested page type, such as a comparison, landing page, or guide. Do not turn every page into a blog post.
- An image or video brief should carry the intended placement, supplied references, exact text that must appear, and any requested size, duration, or visual style. Send reference images as `files` (an `uploadId` from `upload_file` or a public https link), as the shared workflow describes. Never put a local filesystem path in the request as though Daoco could open it.
- A media kit or sponsor pitch needs supported audience numbers and genuine offers or partnerships. Missing rates and metrics remain missing; they are not an invitation to invent them.

## Check what came back

Before reporting success, compare the returned work with the user's request: count, destinations, format, required text, and whether the requested files or saved drafts exist. Distinguish a creative concept from a generated asset and a proposed document change from an applied change.

If a result omits something explicitly requested, name the gap. If the receipt has a `notice` that a file was not sent, fix the attachment before relying on the result. A focused follow-up on the same thread may finish the authorized task; avoid repeatedly restarting the whole job. If it remains incomplete after one corrective follow-up, return the useful work and explain what is still missing. Do not claim to have visually inspected an image or video unless the client actually showed it to you; `get_output` returns an inline preview for images where the client displays it.
