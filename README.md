# Daoco plugin

Marketing for personal and business brands, connected to [Daoco](https://daoco.org).

Use your brand's voice, knowledge, and connected tools to create posts, website
content, images, and campaigns. Publish and schedule posts to your connected
accounts, use your other connected apps, set up recurring work, fix what Daoco
found on your website, and pick up work already underway in Daoco.

No Daoco account is needed to start: signing in from the app creates one, and
the app can set up a personal or business brand from a website, public profiles,
a description, or files in your project. Work runs asynchronously and uses
workspace tokens. Each app working in a brand uses an assistant slot in that
workspace. The app never approves anything: your brand's approval settings
decide whether publishing and changes in connected apps wait for a person, who
decides in Daoco or from their personal assistant through returned links.

## Installation

Grok Build: open `/plugin`, search for **Daoco**, and install.

Claude Code: run `/plugin install daoco --marketplace daocodotorg/daoco-plugin`.

Cursor: install **Daoco** from the Cursor Marketplace.

ChatGPT and Codex: install the **Daoco** plugin from the plugin directory. It connects to
`https://backend.daoco.org/mcp`; the listing lives in `.codex-plugin/plugin.json`.

Any MCP client: add `https://backend.daoco.org/mcp` as a remote MCP server. Setup
for each client is in the [Daoco docs](https://docs.daoco.org/connections/ai-apps).

On first connection, the client opens Daoco sign-in in the browser. Sign in with
your Daoco account, or with a verified email to create one. Do not paste a
password, access token, or verification code into chat.

## What it includes

- MCP server `daoco` at `https://backend.daoco.org/mcp` (streamable HTTP):
  - Brands: `list_brands`, `use_brand`, `create_brand`, `review_brand_setup`,
    `get_brand_context`, `search_brand`, `export_brand`.
  - Work: `list_work`, `upload_file`, `start_work`, `continue_work`,
    `get_work_status`, `read_work`, `stop_work`, `get_output`.
  - Posting: `list_channels`, `get_connect_link`, `create_post`,
    `update_post`, `schedule_post`, `get_post`, `cancel_post`.
  - Connected apps: `list_apps`, `call_app_tool`, `get_app_call`,
    `cancel_app_call`.
  - Website and ideas: `list_improvements`, `get_improvement`,
    `update_improvement`, `list_content_ideas`.
  - Routines: `list_routines`, `create_routine`, `update_routine`,
    `delete_routine`.
- `daoco-marketing`: the shared workflow. Select a brand; start, follow, revise,
  and stop work; attach images and videos; find drafts and pending decisions;
  retrieve reports, images, and videos.
- `daoco-brand-setup`: create a brand, walk through its setup review, connect
  accounts, and offer the first work Daoco suggests.
- `daoco-brand-context`: apply saved voice, audience, positioning, and visual
  identity, and export the brand.
- `daoco-content-and-creative`: brief content and media work, then revise it in
  the same thread.
- `daoco-research-and-planning`: brief research, campaign plans, and
  performance reviews, and read what Daoco suggests making next.
- `daoco-social-posting`: save a post exactly as written, publish or schedule
  it under the brand's approval settings, and connect missing accounts.
- `daoco-connected-apps`: read from or make one change in the brand's CRM,
  store, workspace, or email tool.
- `daoco-website-improvements`: work through Daoco's site fixes in your
  codebase and record progress back in Daoco.
- `daoco-routines`: set up, change, pause, and delete recurring work.

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
- "Schedule this post to my LinkedIn and X for Tuesday at 9am."
- "Pull this week's new deals from HubSpot through Daoco."
- "Every Monday at 8am, have Daoco review last week's posts."
- "Work on my queued Daoco website improvements."
- "What should I post next, based on what has worked?"

The plugin never approves anything. Publishing, scheduling, and changes in
connected apps follow the brand's approval settings in Daoco, and a person
decides any approval there or from their personal assistant. `start_work`,
`continue_work`, and routine runs use the workspace's Daoco tokens; posting and
connected-app calls do not.

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
