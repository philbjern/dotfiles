#!/usr/bin/env python3.7

import asyncio
import iterm2
# This script was created with the "basic" environment which does not support adding dependencies
# with pip.

THEME_LIGHT = "tokyonight-day"
THEME_DARK = "Cyberdyne"


class AutoSwitchTheme:
    def __init__(self, connection, light="Light Background", dark="Dark Background"):
        self.connection = connection
        self.light = light
        self.dark = dark

    async def get_app(self):
        return await iterm2.async_get_app(self.connection)

    async def get_theme(self) -> str:
        print("Gettinig theme...")
        parts = await (await self.get_app()).async_get_theme()
        if len(parts) <= 1:
            return parts[0]
        return ""

    async def set_color_preset(self, theme):
        preset = await iterm2.ColorPreset.async_get(
            self.connection, self.light if theme == "light" else self.dark
        )

        print("Setting color preset....")
        profiles = await iterm2.PartialProfile.async_query(self.connection)
        for partial in profiles:
            await (await partial.async_get_full_profile()).async_set_color_preset(
                preset
            )


async def quit(connection):
    while True:
        if not connection.websocket.open:
            exit(0)
        await asyncio.sleep(1)


async def main(connection):
    # This is an example of using an asyncio context manager to register a custom control
    # sequence. You can send a custom control sequence by issuing this command in a
    # terminal session in iTerm2 while this script is running:
    #
    # printf "\033]1337;Custom=id=%s:%s\a" "shared-secret" "create-window"
    asyncio.ensure_future(quit(connection), loop=asyncio.get_event_loop())

    ast = AutoSwitchTheme(connection, THEME_LIGHT, THEME_DARK)
    await ast.set_color_preset(await ast.get_theme())

    async with iterm2.VariableMonitor(
        connection, iterm2.VariableScopes.APP, "effectiveTheme", None
    ) as mon:
        print("iterm2.VariableMonitor started...")
        while True:
            # Block until theme changes
            theme = await mon.async_get()

            # Set preset if theme has changed
            await ast.set_color_preset(theme)


# This instructs the script to run the "main" coroutine and to keep running even after it returns.
iterm2.run_forever(main)
