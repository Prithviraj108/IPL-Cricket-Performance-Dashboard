-- ============================================================
-- IPL Cricket Performance Dashboard — SQL Queries
-- Database: ipl_database.db (SQLite)
-- Author: Prithviraj Shukla
-- Data: IPL 2008–2023
-- ============================================================


-- ------------------------------------------------------------
-- Query 1: Top 10 Run Scorers (Orange Cap Leaderboard)
-- ------------------------------------------------------------
SELECT
    batter,
    SUM(total_runs)             AS total_runs,
    SUM(matches_played)         AS matches,
    ROUND(AVG(batting_avg), 2)  AS avg_batting_avg,
    ROUND(AVG(strike_rate), 2)  AS avg_strike_rate,
    SUM(fours)                  AS total_fours,
    SUM(sixes)                  AS total_sixes
FROM batting_stats
GROUP BY batter
ORDER BY total_runs DESC
LIMIT 10;


-- ------------------------------------------------------------
-- Query 2: Best Career Strike Rate (min 500 balls faced)
-- ------------------------------------------------------------
SELECT
    batter,
    SUM(total_runs)                                     AS total_runs,
    SUM(balls_faced)                                    AS balls_faced,
    ROUND(SUM(total_runs) * 100.0 / SUM(balls_faced), 2) AS career_strike_rate,
    SUM(sixes)                                          AS total_sixes
FROM batting_stats
GROUP BY batter
HAVING SUM(balls_faced) >= 500
ORDER BY career_strike_rate DESC
LIMIT 10;


-- ------------------------------------------------------------
-- Query 3: Top 10 Wicket Takers (Purple Cap Leaderboard)
-- ------------------------------------------------------------
SELECT
    bowler,
    SUM(wickets)                                                AS total_wickets,
    SUM(matches_played)                                         AS matches,
    ROUND(SUM(runs_conceded) * 6.0 / SUM(balls_bowled), 2)     AS career_economy,
    ROUND(SUM(runs_conceded) * 1.0 / NULLIF(SUM(wickets),0), 2) AS bowling_avg
FROM bowling_stats
GROUP BY bowler
ORDER BY total_wickets DESC
LIMIT 10;


-- ------------------------------------------------------------
-- Query 4: Best Economy Rate (min 200 balls bowled)
-- ------------------------------------------------------------
SELECT
    bowler,
    SUM(wickets)                                                 AS total_wickets,
    SUM(balls_bowled)                                            AS balls_bowled,
    ROUND(SUM(runs_conceded) * 6.0 / SUM(balls_bowled), 2)      AS career_economy,
    ROUND(SUM(balls_bowled) * 1.0 / NULLIF(SUM(wickets),0), 2)  AS bowling_strike_rate
FROM bowling_stats
GROUP BY bowler
HAVING SUM(balls_bowled) >= 200
ORDER BY career_economy ASC
LIMIT 10;


-- ------------------------------------------------------------
-- Query 5: Toss Impact Analysis
-- ------------------------------------------------------------
SELECT
    toss_decision,
    COUNT(*)                                                        AS total_matches,
    SUM(CASE WHEN toss_winner = winner THEN 1 ELSE 0 END)           AS toss_winner_won,
    ROUND(SUM(CASE WHEN toss_winner = winner THEN 1 ELSE 0 END)
          * 100.0 / COUNT(*), 1)                                    AS win_pct
FROM matches
WHERE winner != 'No Result'
GROUP BY toss_decision;


-- ------------------------------------------------------------
-- Query 6: Team Win % by Season
-- ------------------------------------------------------------
SELECT
    team,
    season,
    matches_played,
    wins,
    losses,
    win_pct
FROM team_performance
ORDER BY season DESC, win_pct DESC;


-- ------------------------------------------------------------
-- Query 7: Best Venues for Chasing (min 10 matches)
-- ------------------------------------------------------------
SELECT
    venue,
    COUNT(*)                                                        AS total_matches,
    SUM(CASE WHEN win_by_runs > 0 THEN 1 ELSE 0 END)               AS batting_first_wins,
    SUM(CASE WHEN win_by_wickets > 0 THEN 1 ELSE 0 END)            AS chasing_wins,
    ROUND(SUM(CASE WHEN win_by_wickets > 0 THEN 1 ELSE 0 END)
          * 100.0 / COUNT(*), 1)                                    AS chase_win_pct
FROM matches
WHERE winner != 'No Result'
GROUP BY venue
HAVING total_matches >= 10
ORDER BY chase_win_pct DESC
LIMIT 10;


-- ------------------------------------------------------------
-- Query 8: Most Player of the Match Awards
-- ------------------------------------------------------------
SELECT
    player_of_match,
    COUNT(*)                    AS potm_awards,
    COUNT(DISTINCT season)      AS seasons_active
FROM matches
WHERE player_of_match != 'Unknown'
GROUP BY player_of_match
ORDER BY potm_awards DESC
LIMIT 10;
