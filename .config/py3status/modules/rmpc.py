import json


class Py3status:
    """ """
    button_next = None
    button_pause = 1
    button_previous = None
    button_stop = 3
    cache_timeout = 5
    is_paused = None
    is_playing = None
    is_stopped = None
    format = (
        r"[\?if=is_started [\?if=is_playing > ][\?if=is_paused \|\| ]"
        r"[\?if=is_stopped .. ][[{artist}][\?soft  - ][{title}]"
        r"|\?show rmpc: waiting for user input]]"
    )
    replacements = None
    sleep_timeout = 20

    def post_config_hook(self):
        if not self.py3.check_commands("rmpc"):
            raise Exception("not installed")
        self.color_stopped = self.py3.COLOR_STOPPED or self.py3.COLOR_BAD
        self.color_paused = self.py3.COLOR_PAUSED or self.py3.COLOR_DEGRADED
        self.color_playing = self.py3.COLOR_PLAYING or self.py3.COLOR_GOOD
        self.replacements_init = self.py3.get_replacements_list(self.format)

    def _get_song_data(self):
        try:
            data = json.loads(self.py3.command_output(["rmpc", "song"]))
            song_data = {
                "artist": data.get("metadata").get("artist"),
                "title": data.get("metadata").get("title")
            }
        except self.py3.CommandError:
            song_data = {}
        return song_data

    def _get_rmpc_data(self):
        try:
            data = json.loads(self.py3.command_output(["rmpc", "status"]))
            is_started = True
        except self.py3.CommandError:
            data = {}
            is_started = False
        return is_started, data

    def rmpc(self):
        """ """
        cached_until = self.sleep_timeout
        color = self.py3.COLOR_BAD
        is_started, rmpc_data = self._get_rmpc_data()
        if is_started:
            cached_until = self.cache_timeout
            state = rmpc_data.get("state")
            if state == "Play":
                self.is_playing = True
                color = self.color_playing
            elif state == "Pause":
                self.is_paused = True
                color = self.color_paused
            elif state == "Stop":
                self.is_stopped = True
                color = self.color_stopped
        for x in self.replacements_init:
            if x in rmpc_data:
                rmpc_data[x] = self.py3.replace(rmpc_data[x], x)
        rmpc_data.update(
            {
                "is_paused": self.is_paused,
                "is_playing": self.is_playing,
                "is_started": is_started,
                "is_stopped": self.is_stopped,
            }
        )
        rmpc_data.update(self._get_song_data())
        return {
            "cached_until": self.py3.time_in(cached_until),
            "color": color,
            "full_text": self.py3.safe_format(self.format, rmpc_data),
        }

    def on_click(self, event):
        """ Control rmpc with mouse clicks. """
        button = event["button"]
        if button == self.button_pause:
            if self.is_playing:
                self.py3.command_run("rmpc pause")
                self.is_stopped = False
                self.is_paused = True
                self.is_playing = False
            elif self.is_stopped or self.is_paused:
                self.py3.command_run("rmpc play")
                self.is_stopped = False
                self.is_paused = False
                self.is_playing = True
        elif button == self.button_stop:
            self.py3.command_run("rmpc stop")
            self.is_stopped = True
            self.is_paused = False
            self.is_playing = False
        elif button == self.button_next:
            self.py3.command_run("rmpc next")
        elif button == self.button_previous:
            self.py3.command_run("rmpc prev")
        else:
            self.py3.prevent_refresh()


if __name__ == "__main__":
    """ Run module in test mode. """
    from py3status.module_test import module_test

    module_test(Py3status)
