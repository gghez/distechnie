Load the creative context for a story to prepare a writing session.

Argument: the story slug (directory name under src/), e.g. "le-dernier-developpeur"

Steps:
1. Read the file `src/$ARGUMENTS/guidelines.md` and internalize the creative guidelines (concept, characters, tone, structure, writing principles). Display a short summary to confirm loading.
2. List all existing chapter files in `src/$ARGUMENTS/` and display them with their titles (extracted from the first H1 line of each file).
3. Read `src/$ARGUMENTS/index.md` and check if the story has a WIP banner.
4. Read `src/SUMMARY.md` to check if there are any draft chapters (empty links `[Title]()`).
5. Present a brief status report:
   - Story title
   - Status (WIP or complete)
   - Number of chapters written
   - Any planned but unwritten chapters (from SUMMARY.md draft entries)
   - Key reminders from the guidelines (tone, POV, constraints)
6. Confirm you are ready to work on this story and ask the user what they want to do (write a new chapter, edit an existing one, brainstorm, etc.)
