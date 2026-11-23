# Grok Bot templates

Eight Grok Bots for marketing, each built on the Daoco MCP. Each one works alone, and together they work as a crew on one brand. They all read and write the same brand in Daoco: one memory, one set of connected accounts, and one approval step that the person controls.

| File | Bot | What it does |
| --- | --- | --- |
| [01-brand-desk.md](01-brand-desk.md) | Brand Desk | Sets up the brand from a website or profiles, connects accounts, weekly check-in |
| [02-week-of-posts.md](02-week-of-posts.md) | Week of Posts | A week of drafts every Monday, from what the audience rewarded |
| [03-whats-working.md](03-whats-working.md) | What's Working | Friday results on every connected account, keeps the patterns that held |
| [04-reply-desk.md](04-reply-desk.md) | Reply Desk | Drafts replies and finds conversations, queued for the person to send |
| [05-website-fix-desk.md](05-website-fix-desk.md) | Website Fix Desk | Site and Search Console review, fixes as pull requests or steps, checked later |
| [06-competitor-watch.md](06-competitor-watch.md) | Competitor Watch | Weekly competitor changes, turned into post ideas |
| [07-repurpose-desk.md](07-repurpose-desk.md) | Repurpose Desk | One page, post, video, or photo set becomes drafts for every channel |
| [08-brand-crew-lead.md](08-brand-crew-lead.md) | Brand Crew Lead | Plans the week, hands work to the other bots, daily approval digest |

## Publishing one

1. Submit the Daoco app once: on grok-bot.directory, Submit > App, with `https://github.com/daocodotorg/daoco-plugin`. The bots tell people to add it.
2. In Grok, create a new bot. Paste the file's Name, Title, Description, and Instructions, and add its Routines.
3. Add the Daoco app to your own Grok account and give the bot one run, so you know it works.
4. Ask the bot to "Share yourself as a public template", or use Settings > Share as Template > Public > Publish, and copy the link.
5. On grok-bot.directory, Submit > Bot, paste the link, and choose Marketing.

Templates carry instructions and routines. They do not carry MCP servers or secrets, so every bot begins with the same setup block. It checks for the Daoco tools and, if they are missing, tells the person to add the Daoco app and sign in.

## Rules every template keeps

- Every bot on one Grok account shares one Daoco connection, so to Daoco they are one agent: one name, one assistant slot per workspace, one author on the Agent board. The bots pass `brandId` on every call, never call `set_app_name`, and start board notes with a `From: <bot> -> To: <bot>` line. See the `daoco-agent-team` skill.
- The bots never approve, publish, or send. They save drafts and queue replies; the brand's approval settings in Daoco decide what goes out, and the person decides from the review links.
- Where Daoco can do the repeat work itself, a bot sets up a Daoco automation and only reports on it from its Grok routine. Daoco refuses a second automation doing the same work.
- The description is what people read on the directory. It says what the bot does and who it is for. It is never written as instructions to the bot.
