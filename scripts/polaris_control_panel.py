from io import StringIO

import OpenGL.GL as gl
import glfw
import imgui
from imgui.integrations.glfw import GlfwRenderer

from polaris_fetch import *
from research.imgui_hello_world import impl_glfw_init


class GUI(object):
    def __init__(self):
        super().__init__()
        self.backgroundColor = (0, 0, 0, 1)
        self.window = impl_glfw_init()
        gl.glClearColor(*self.backgroundColor)
        imgui.create_context()
        self.impl = GlfwRenderer(self.window)

        self.sat_name = "LightSail-2"  # Default satellite name
        self.start_date = "2019-07-07"  # Default start date
        self.end_date = "2020-11-15"  # Default end date
        self.base_data_dir = "../data"  # Default base data directory
        self.console_output = []  # Console output variable

        # Set up logging to StringIO
        self.log_stream = StringIO()
        # Assuming the logger has already been configured
        # Add a StreamHandler to output to stdout
        stdout_handler = logging.StreamHandler(self.log_stream)
        stdout_handler.setLevel(logging.INFO)  # Set the logging level

        # Optionally, add a formatter
        formatter = logging.Formatter(
            '%(asctime)s - %(name)s - %(levelname)s - %(message)s')
        stdout_handler.setFormatter(formatter)
        logging.getLogger().addHandler(stdout_handler)
        self.last_log_line = ""

        self.loop()

    def loop(self):
        while not glfw.window_should_close(self.window):
            glfw.poll_events()
            self.impl.process_inputs()
            imgui.new_frame()
            imgui.begin("Polaris Satellite Data", True)

            # Input fields for satellite name, period, and base data directory
            _, self.sat_name = imgui.input_text("Satellite Name", self.sat_name,
                                                256)
            _, self.start_date = imgui.input_text("Start Date", self.start_date,
                                                  256)
            _, self.end_date = imgui.input_text("End Date", self.end_date, 256)
            _, self.base_data_dir = imgui.input_text("Base Data Directory",
                                                     self.base_data_dir, 256)

            # Buttons to trigger functions
            if imgui.button("Fetch Data"):
                run_polaris_fetch(self.sat_name, self.start_date, self.end_date,
                                  self.base_data_dir)
            if imgui.button("Learn"):
                run_polaris_learn(self.sat_name, self.base_data_dir)
            if imgui.button("Behave"):
                run_polaris_behave(self.sat_name, self.base_data_dir)

            # Display console output
            imgui.text("Console Output:")

            log_text: str = self.log_stream.getvalue()
            if self.last_log_line != log_text and log_text != "":
                self.last_log_line = log_text
                self.console_output.clear()
                self.console_output.append(log_text)

            for line in self.console_output:
                imgui.text(line)

            imgui.end()

            imgui.render()

            gl.glClearColor(*self.backgroundColor)
            gl.glClear(gl.GL_COLOR_BUFFER_BIT)

            self.impl.render(imgui.get_draw_data())
            glfw.swap_buffers(self.window)

        self.impl.shutdown()
        glfw.terminate()


if __name__ == "__main__":
    gui = GUI()
