# Daoco plugin

Marketing for personal and business brands, connected to [Daoco](https://daoco.org).

Use your brand's voice, knowledge, and connected tools to create posts, website
content, images, and campaigns. Research your audience, review performance, and
pick up work already underway in Daoco.

Sign in with a Daoco account. Where the server offers brand setup, signing in
creates an account and the app can set up a personal or business brand from a
website, public profiles, or a description; otherwise create the brand at
daoco.org first. Work runs asynchronously and uses workspace tokens. Each app
bound to a brand uses an assistant slot. Approvals, publishing, and scheduling
happen in the Daoco dashboard through returned review links.

## Installation

Grok Build: open `/plugin`, search for **Daoco**, and install.

Cursor: install **Daoco** from the Cursor Marketplace.

ChatGPT and Codex: install the **Daoco** plugin from the plugin directory. It uses
the approved Daoco app, mapped in `.app.json`; the listing lives in
`.codex-plugin/plugin.json`.

Any MCP client: add `https://backend.daoco.org/mcp` as a remote MCP server. Setup
for each client is in the [Daoco docs](https://docs.daoco.org/connections/ai-apps).

On first connection, the client opens Daoco sign-in in the browser. Sign in with
your Daoco account, or with a verified email to create one. Do not paste a
password, access token, or verification code into chat.

## What it includes

- MCP server `daoco` at `https://backend.daoco.org/mcp` (streamable HTTP):
  `list_brands`, `use_brand`, `get_brand_context`, `search_brand`,
  `list_work`, `start_work`, `continue_work`, `get_work_status`, `read_work`,
  `stop_work`, `get_output`. Newer servers add `create_brand`,
  `review_brand_setup`, and `upload_file`; the skills use them only when the
  server lists them.
- `daoco-marketing`: start, follow, revise, and stop work; attach images; find
  drafts and pending decisions; retrieve reports, images, and videos.
- `daoco-brand-setup`: create a brand, review its drafted profile, and offer the
  first work Daoco suggests.
- `daoco-brand-context`: apply saved voice, audience, positioning, and visual identity.
- `daoco-content-and-creative`: brief content and media work, then revise it in the same thread.
- `daoco-research-and-planning`: brief research, campaign plans, and performance reviews.

These skills use the same Daoco runtime for both personal and business brands.
They adapt to the selected brand's context and the user's goal. Task-specific
brief guidance and result checks cover post batches, repurposing, pages, media,
creator kits, performance reviews, campaign plans, and website research. Full
production procedures stay in Daoco so they can improve without a plugin update.

## Example requests

- "Set up my personal brand in Daoco from my LinkedIn profile."
- "Use my personal brand in Daoco to draft a LinkedIn post from these notes."
- "Create three product launch images for my business in Daoco in the style of this reference image."
- "Ask Daoco to research which topics matter to my audience."
- "Show me the finished images from that Daoco thread."
- "What is waiting for my review in Daoco?"

The plugin cannot approve, publish, or schedule anything. Those decisions stay
in the Daoco dashboard. `start_work` and `continue_work` use the workspace's
Daoco tokens.

## Authentication

OAuth 2.1 with WorkOS AuthKit as the authorization server. The access token's
audience is the MCP endpoint, and it is sent as `Authorization: Bearer` on
`/mcp`. No API key is stored in the plugin. Tools are scoped to the brands in
the signed-in person's Daoco workspaces.

Network endpoints:

- `https://backend.daoco.org/mcp`: hosted MCP server
- `https://backend.daoco.org/.well-known/oauth-protected-resource/mcp`:
  protected resource metadata
- `https://auth.daoco.org`: sign-in and token issuance

Documentation: https://docs.daoco.org/connections/ai-apps

## License

Proprietary. Use of the hosted service is governed by Daoco's
[terms](https://daoco.org/tos) and [privacy policy](https://daoco.org/privacy).
