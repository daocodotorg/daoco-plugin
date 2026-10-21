---
name: daoco-research-and-planning
description: Ask Daoco to research audiences or competitors, plan campaigns, review marketing performance, or investigate website and SEO opportunities for a personal or business brand.
---

# Research and plan with Daoco

Read [the shared Daoco workflow](../daoco-marketing/SKILL.md) for selection, execution, retries, results, and approvals.

Frame the request around the decision the user wants to make. Preserve any named competitors, audience, geography, period, channels, budget, and success measure. Do not require every field for an exploratory request. Use saved brand context where relevant and ask only for missing information that would change the research.

Adapt the brief to the brand's actual goals. A personal brand may be building an audience, attracting clients, or finding sponsors; a business may be growing demand or selling products. Do not substitute those examples for the user's goals.

Send the brief through `start_work`, or `continue_work` when extending an existing investigation. Daoco selects research and planning specialists and accesses its available connections. Do not promise data from an account merely because the platform supports that integration.

Read the finished report with `read_work`, preserving sources, measurement periods, limitations, and distinctions between observed results and recommendations. Use `get_output` for a returned chart or report; where the client cannot show it, share the PNG link and the thread link. Report unavailable data as unavailable, not zero. A plan does not authorize executing every recommendation; start subsequent production only when the user requests it.

## Match evidence to the decision

- For performance reviews, carry the requested period and accounts into the brief. Expect the report to name its sample, the denominator for rates, and the posts behind its conclusions. Missing metrics are not zero; raw totals across differently sized accounts do not establish which strategy works better.
- For audience or competitor research, distinguish observed behavior, quoted statements, and inferred motivations. A handful of examples can suggest a hypothesis without proving a market-wide pattern.
- For campaign planning, preserve the user's objective, offer, audience, channels, dates, and budget when supplied. Ask Daoco to make the plan actionable at the requested level of detail. Do not substitute a list of channels for a campaign plan or imply that planned spend has been authorized.
- For SEO and website work, preserve the site, pages, and questions in scope. Distinguish measured search or analytics data from public-page observations and hypotheses. A proposed fix is not a deployed change.

Before presenting recommendations, check whether the report connects each important decision to evidence and names a way to judge the outcome. Retain uncertainty from small samples and unavailable sources. If a requested conclusion is unsupported, say so instead of strengthening its wording. Request a focused correction in the same thread when necessary to finish the original task; after one unsuccessful correction, return the evidence available and the unresolved gap.
