-- Mainframe Override Workshop
-- Author: Charles Wade
-- Date: June 2026
-- Purpose: Shut down EmptyStack’s TAXI project by tracing forum clues and employee credentials.

-- STEP 1: Find the forum post written in April 2048 mentioning EmptyStack and dad.
SELECT * FROM forum_posts
WHERE date BETWEEN '2048-04-01' AND '2048-05-01'
  AND content ILIKE '%emptystack%'
  AND content ILIKE '%dad%';

-- Observation: The author of that post is 'smart-money-44'.

-- STEP 2: Get details for the author 'smart-money-44'.
SELECT * FROM forum_accounts
WHERE username = 'smart-money-44';

-- Observation: The full name of 'smart-money-44' is 'Brad Steele'.

-- STEP 3: Find other forum accounts with the same last name.
SELECT * FROM forum_accounts
WHERE last_name = 'Steele';

-- STEP 4: Check EmptyStack employee accounts with the same last name.
SELECT * FROM emptystack_accounts
WHERE last_name = 'Steele';

-- Observation: There is one overlap — Andrew Steele.
-- His username is 'triple-cart-38' and his password is 'password456'.

-- STEP 5: Use those credentials with `node mainframe` to generate emptystack.sql.
-- That file adds two new tables: emptystack_messages and emptystack_projects.

-- STEP 6: Search messages mentioning the taxi project.
SELECT * FROM emptystack_messages
WHERE body ILIKE '%taxi%' OR body ILIKE '%project%';

-- Observation: The message is sent from 'your-boss-99'.

-- STEP 7: Retrieve 'your-boss-99' credentials.
SELECT * FROM emptystack_accounts
WHERE username = 'your-boss-99';

-- Observation: Their password is 'notagaincarter'.

-- STEP 8: Find the project ID for TAXI.
SELECT * FROM emptystack_projects
WHERE code = 'TAXI';

-- Observation: The project ID is 'DczE0v2b'.

-- STEP 9: Final step — provide credentials to shut down the project.
-- Run this in your terminal:
-- node mainframe -stop
-- username: your-boss-99
-- password: notagaincarter
-- project ID: DczE0v2b

-- Workshop complete!
