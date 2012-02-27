/*

some just some audit-y stuff to compare data against NHL.com or whatever

*/

-- Regular season LA Kings goal totals by players
set search_path to nhl;

select
    player_id,
    name,
    sum(1) g
from events
inner join games using (game_id)
inner join players using (player_id)
where
    events.team_id = 26
    and type = 'Goal'
    and date >= '2011-10-07'
    and period <= 4
group by events.player_id, players.name
order by g desc;