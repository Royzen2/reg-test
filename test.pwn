forward OnError(player_id);
forward OnReg(player_id, const arg[]);

public OnGameModeInit()
{
    cef_subscribe("error", "OnError");
    cef_subscribe("data:reg", "OnReg");

}
public OnPlayerSpawn(playerid)
{
  cef_create_browser(playerid, 1, "url на сайт", false, true);
}
public OnError(player_id)
{
    SendMessage(player_id, -1, "вы не ввели логин или пароль");
    return 1;
}
public OnReg(player_id, const arg[])
{
    
    new name[40], pass;
    sscanf(arg, "s[40]i", name, pass);
    SendMessage(player_id, -1, name);
    SendMessage(player_id, -1, pass);
    new query[500];
    format(query, 500, "INSERT INTO table ('name', 'pass') VALUES ('%s', '%d')", name, pass);
    mysql_query(connect to base, query);
}
