--Select the Top Goal Scorers
SELECT
    [team],
    SUM([number_of_goals]) AS total_goals
FROM
    (
        SELECT [team1] AS [team], [number_of_goals_team1] AS [number_of_goals] FROM [Fifa_2022]
        UNION ALL
        SELECT [team2] AS [team], [number_of_goals_team2] AS [number_of_goals] FROM [Fifa_2022]
    ) AS teams
GROUP BY
    [team]
ORDER BY
    total_goals DESC;

-- Matches with most attempts
SELECT
    [team1],
    [team2],
    [total_attempts_team1] + [total_attempts_team2] AS total_attempts
FROM
    [Fifa_2022]
ORDER BY
    total_attempts DESC;

-- Teams with the highest pass completion rate
SELECT
    [team],
    AVG([passes_completed] * 1.0 / [passes]) AS pass_completion_rate
FROM
    (
        SELECT [team1] AS [team], [passes_completed_team1] AS [passes_completed], [passes_team1] AS [passes] FROM [Fifa_2022]
        UNION ALL
        SELECT [team2] AS [team], [passes_completed_team2] AS [passes_completed], [passes_team2] AS [passes] FROM [Fifa_2022]
    ) AS teams
GROUP BY
    [team]
ORDER BY
    pass_completion_rate DESC;

-- Teams with the most defensive pressure applied
SELECT
    [team],
    MAX([defensive_pressures_applied]) AS max_defensive_pressures
FROM
    (
        SELECT [team1] AS [team], [defensive_pressures_applied_team1] AS [defensive_pressures_applied] FROM [Fifa_2022]
        UNION ALL
        SELECT [team2] AS [team], [defensive_pressures_applied_team2] AS [defensive_pressures_applied] FROM [Fifa_2022]
    ) AS teams
GROUP BY
    [team]
ORDER BY
    max_defensive_pressures DESC;

--Top goal scoreres per category
SELECT
    category,
    SUM(number_of_goals_team1 + number_of_goals_team2) AS total_goals
FROM Fifa_2022
GROUP BY category;

--Teams with most attempts inside the penalty area
SELECT
    team,
    MAX(attempts_inside_penalty_area) AS max_attempts_inside_penalty_area
FROM (
    SELECT team1 AS team, MAX(attempts_inside_penalty_area_team1) AS attempts_inside_penalty_area
    FROM Fifa_2022
    GROUP BY team1
    UNION ALL
    SELECT team2 AS team, MAX(attempts_inside_penalty_area_team2) AS attempts_inside_penalty_area
    FROM Fifa_2022
    GROUP BY team2
) t
GROUP BY team;

--Teams with the Highest Possession Average
SELECT
    MAX(poss_avg) AS max_possession_avg_team,
    MAX(team) AS team
FROM (
    SELECT team, AVG(CONVERT(DECIMAL(5, 2), REPLACE(p.possession_in_contest, '%', ''))) AS poss_avg
    FROM (
        SELECT team1 AS team, possession_in_contest
        FROM Fifa_2022
        UNION ALL
        SELECT team2 AS team, possession_in_contest
        FROM Fifa_2022
    ) p
    GROUP BY team
) t; 