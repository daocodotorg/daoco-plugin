---
name: daoco-brand-setup
description: Create a personal or business brand in Daoco from a website, public profiles, or the person's own description, walk them through the setup review, and offer the first work Daoco suggests. Use when the person has no Daoco brand yet or asks to add one.
---

# Set up a brand in Daoco

Read [the shared Daoco workflow](../daoco-marketing/SKILL.md) for sign-in, tool boundaries, and running work.

This skill needs the `create_brand` and `review_brand_setup` tools. If the Daoco server does not list them, it cannot create a brand from the app: send the person to https://daoco.org to create the brand there, then select it with `use_brand`. Do not call a tool the server does not list. On servers that offer them, signing in from the app creates a Daoco account when the person has none, so a new person can start here.

## Gather what Daoco needs

Call `list_brands` first. If the person already has a brand that fits, select it with `use_brand` instead of creating a duplicate.

`create_brand` needs a `name`, a `type`, and at least one of `website`, `profiles`, or `about`:

- `type` is `personal` when the person is the brand (a creator, founder, consultant, or expert) and `business` for a company, product, or organization. Ask when it is unclear; do not guess from the name.
- `website` and `profiles` (up to five public social profile URLs) are what Daoco researches. `about` is a description in the person's own words, used alone when there is no site or profile. Pass what the person gave; do not write `about` for them from a guess.
- For a personal brand, `goals` (what they are after, such as clients, speaking, an audience, or brand deals) and `focus` (their niche or the role they are aiming for) shape what Daoco suggests later. Ask once; they are optional.

Tell the person before calling that the brand uses an assistant slot and counts toward the workspace's brand limit. A person who administers no workspace gets their own on the free Starter trial, with no card. If they administer several, the call returns their names and `workspaceId`s and creates nothing; ask which and call again with `workspaceId`. Use a `clientRequestId` so a retried call returns the same brand instead of creating a second one.

The new brand is selected for the app. Share the returned brand and connections links: connecting social accounts and other apps happens in Daoco, not here.

## Review the setup

Research takes a few minutes. Call `review_brand_setup` with `waitSeconds` up to 30 to wait for the drafted profile; while research runs the profile is partial and there are no questions yet. Keep waits bounded and tell the person what is happening.

When research lands, show the person the drafted name, description, industry, audience, tone, and voice notes, and the open questions. Then:

- Pass only the fields the person corrected; given fields replace the drafted values. Do not "improve" a field they accepted.
- Answer a question with its `questionId` and the person's `answer`, in their words. These answers become the brand's documents, so never answer a question for them, and never fill in beliefs, experiences, credentials, or results they did not state. Skipping a question is fine.
- Call with `confirm: true` once the person is satisfied. Daoco then writes the brand's summary, voice, and documents, which takes a few minutes.

The person can skip the review: confirm right away, or leave it, and setup finishes on its own 30 minutes after the brand was created. Only the person who created the brand can change the review. A brand set up in the Daoco dashboard has no review here, and a review the person takes over in Daoco or that has already finished is closed to the app; `review_brand_setup` says so. Then share the brand's Daoco link and continue there.

## Offer the first work

`get_brand_context` reports `setup` while the brand is being set up: `researching`, `review` (waiting in `review_brand_setup`), `writing`, or `needs_review` with a link to finish in Daoco. Report that state instead of starting work against a half-written brand.

When setup finishes, `get_brand_context` may list `firstWork`: up to three suggested first pieces of work, each a ready `start_work` request that runs a Daoco command, such as a point-of-view post or a bio kit. Offer them in plain words and let the person choose. Pass the chosen request to `start_work` as given, and follow it with the shared workflow. Starting it uses workspace tokens. Work that reads the person's own posts appears after they connect accounts in Daoco.
