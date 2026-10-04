# Daoco plugin

Connect an AI client to [Daoco](https://daoco.org), a brand's marketing workspace.
Read brand context, drafts, and pending decisions, start marketing work in
Daoco, and follow it to a dashboard review link.

## Installation

Grok Build: open `/plugin`, search for **Daoco**, and install.

Any MCP client: add `https://backend.daoco.org/mcp` as a remote MCP server. Setup
for each client is in the [Daoco docs](https://docs.daoco.org/connections/ai-apps).

On first connection, the client opens Daoco sign-in in the browser. Use your Daoco
account. Do not paste a password, access token, or verification code into chat.

## What it includes

- MCP server `daoco` at `https://backend.daoco.org/mcp` (streamable HTTP):
  `list_brands`, `use_brand`, `get_brand_context`, `find_drafts`,
  `list_needs_you`, `list_recent_work`, `start_work`, `continue_work`,
  `get_work_status`.
- Skill `daoco-marketing`: how to pick a brand, start and follow work, and
  hand approvals back to the Daoco dashboard.

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
