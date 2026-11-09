---
name: daoco-routines
description: Set up, change, pause, or delete recurring work that Daoco runs for the brand on a schedule while the app is closed, such as a weekly performance review or a daily post idea, and read what the runs produced. Use when the person wants something done every day, week, or few hours, or once at a later time.
---

# Set up recurring work in Daoco

Read [the shared Daoco workflow](../daoco-marketing/SKILL.md) for brand selection and tool boundaries.

A routine is a request Daoco runs on a schedule. Each run starts a new brand thread owned by the person, as `start_work` does, and keeps going while the app is closed. Every run uses workspace tokens, and its drafts and approvals follow the brand's approval settings. Say both before creating one.

## Create a routine

Create a routine only when the person asked for recurring or later work. `create_routine` takes a short `name`, the `instructions` each run sends, and exactly one schedule:

- `intervalMinutes`, 30 or more, counted from now (1440 is daily).
- `cron`, five fields, read in `timezone` (`0 9 * * 1` is Mondays at 9:00). Runs at most every 30 minutes.
- `runAt`, an ISO 8601 time for a single run later.

Ask for the person's time zone when the schedule depends on a local time, and pass it as an IANA name; the default is UTC. Use a `clientRequestId` so a retry does not create a second routine.

Write `instructions` as one complete request in the person's words, since each run reads only them, the routine's latest runs, and the brand's scheduled and recent posts. A run may start with a Daoco command, such as `/performance-review` or `/check-pages`. Keep the scope the person gave: a routine that drafts does not publish unless they asked, and even then publishing follows the brand's approval settings. Do not set a frequency higher than the request needs, since each run costs tokens. A run still working when the next one is due skips that one.

Confirm what was created: name, schedule in words, first run time (`nextRunAt`), and that it can be paused or deleted from the app.

## Manage routines

`list_routines` lists this app's routines in the brand with status, schedule, next and last run, and the three latest runs with their `threadId` and Daoco link. Routines made by other apps or the team assistant are not listed; those are managed in Daoco. A one-time routine drops off the list after it runs; find its thread with `list_work`.

`update_routine` changes the name, instructions, schedule, time zone, or status. `paused` stops runs and `active` resumes them from now. `delete_routine` ends a routine; a run already working finishes, and past threads stay. Delete only the routine the person named. An app has at most 25 routines. Daoco may pause one itself (`pausedBecause`), for example when the app is turned off; report the reason.

## Read the results

Each run is an ordinary thread. Read it with `get_work_status`, `read_work`, and `get_output` as the shared workflow describes, and check `list_work` with `view: "needs_you"` for approvals runs raised.
