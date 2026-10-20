---
name: daoco-brand-context
description: Read and apply a personal or business brand's saved voice, audience, positioning, and visual identity from Daoco. Use for brand questions or to ground the user's current work in their Daoco context.
---

# Use brand context

Read [the shared Daoco workflow](../daoco-marketing/SKILL.md) for brand selection and tool boundaries. Call `get_brand_context` for the selected brand and use the relevant facts and documents to answer or inform the user's work.

For a personal brand, preserve the person's stated expertise, point of view, audience, and preferred voice. Do not invent credentials, personal experiences, endorsements, or first-person stories. For a business brand, preserve its offers, customers, positioning, and approved claims. The saved context and the user's request determine the voice; do not assume every personal brand speaks casually or every business uses "we."

Distinguish saved facts from your suggestions. If a material detail is missing, ask a focused question or state the gap. Do not turn a brand question into a paid work request. If the user asks to update the saved brand, delegate that request through `start_work` or the relevant existing thread and report the actual result before claiming it was saved.
