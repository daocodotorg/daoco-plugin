# Daoco plugin

Marketing for personal and business brands, connected to [Daoco](https://daoco.org).

Use your brand's voice, knowledge, and connected tools to create posts, website
content, images, and campaigns. Research your audience, review performance, and
pick up work already underway in Daoco.

Requires an existing Daoco account with workspace access. Work runs asynchronously
and uses workspace tokens. Each app bound to a brand uses an assistant slot.
Approvals, publishing, and scheduling happen in the Daoco dashboard through
returned review links.

## Installation

Grok Build: open `/plugin`, search for **Daoco**, and install.

Cursor: install **Daoco** from the Cursor Marketplace.

Any MCP client: add `https://backend.daoco.org/mcp` as a remote MCP server. Setup
for each client is in the [Daoco docs](https://docs.daoco.org/connections/ai-apps).

On first connection, the client opens Daoco sign-in in the browser. Use your Daoco
account. Do not paste a password, access token, or verification code into chat.

## What it includes

- MCP server `daoco` at `https://backend.daoco.org/mcp` (streamable HTTP):
  `list_brands`, `use_brand`, `get_brand_context`, `find_drafts`,
  `list_needs_you`, `list_recent_work`, `start_work`, `continue_work`,
  `get_work_status`, `read_work`, `stop_work`, `show_visual`, `get_asset`.
- `daoco-marketing`: start, follow, revise, and stop work; find drafts and
  pending decisions; retrieve results and assets.
- `daoco-brand-context`: apply saved voice, audience, positioning, and visual identity.
- `daoco-content-and-creative`: brief content and media work, then revise it in the same thread.
- `daoco-research-and-planning`: brief research, campaign plans, and performance reviews.

These skills use the same Daoco runtime for both personal and business brands.
They adapt to the selected brand's context and the user's goal. Task-specific
brief guidance and result checks cover post batches, repurposing, pages, media,
creator kits, performance reviews, campaign plans, and website research. Full
production procedures stay in Daoco so they can improve without a plugin update.

## Example requests

- "Use my personal brand in Daoco to draft a LinkedIn post from these notes."
- "Create three product launch image concepts for my business in Daoco."
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
