/// @description  Gamepad either connected or disconnected

switch (ds_map_find_value(async_load, "event_type"))
{
    // Gamepad Connected
    case "gamepad discovered":
        if (gamepadSlot == -1)
        {
            var _pad      = ds_map_find_value(async_load, "pad_index");
            var _padInUse = inputdog_is_slot_in_use(_pad, false);
            
            if (!_padInUse)
            {
                gamepadSlot = _pad;
                show_debug_message("found gamepad");
            }
        }
    break;
    
    // Gamepad Disconnected
    case "gamepad lost":
        var _pad = ds_map_find_value(async_load, "pad_index");
        
        if (_pad == gamepadSlot)
        {
            gamepadSlot = -1;
            show_debug_message("gamepad disconnected");
        }
    break;
}


