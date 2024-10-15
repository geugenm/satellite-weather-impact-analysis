"""Module for LearnParameters class
"""


# pylint: disable=too-many-instance-attributes, too-many-arguments
# placeholder class for parameters. Hence,
# only one method and large number of parameters
class LearnParameters():
    """Learn parameters class
    """
    def __init__(self,
                 input_file=None,
                 output_graph_file=None,
                 configuration_file=None,
                 graph_link_threshold=None,
                 target_column=None,
                 use_gridsearch=None,
                 csv_sep=None,
                 force_cpu=None):
        self._input_file = input_file
        self._output_graph_file = output_graph_file
        self._configuration_file = configuration_file
        self._graph_link_threshold = graph_link_threshold
        self._target_column = target_column
        self._cli_use_gridsearch = use_gridsearch
        self._csv_sep = csv_sep
        self._force_cpu = force_cpu

    @property
    def input_file(self):
        """
        Return the input_file value as String.

        """

        return self._input_file

    @input_file.setter
    def input_file(self, input_file):
        self._input_file = input_file

    @property
    def output_graph_file(self):
        """
        Return the output_graph_file value as String.

        """

        return self._output_graph_file

    @output_graph_file.setter
    def output_graph_file(self, output_graph_file):
        self._output_graph_file = output_graph_file

    @property
    def configuration_file(self):
        """
        Return the configuration_file value as String.

        """

        return self._configuration_file

    @configuration_file.setter
    def configuration_file(self, configuration_file):
        self._configuration_file = configuration_file

    @property
    def graph_link_threshold(self):
        """
        Return the graph_link_threshold value as Float.

        """

        return self._graph_link_threshold

    @graph_link_threshold.setter
    def graph_link_threshold(self, graph_link_threshold):
        self._graph_link_threshold = graph_link_threshold

    @property
    def use_gridsearch(self):
        """
        Return the use_gridsearch value as Boolean.

        """

        return self._cli_use_gridsearch

    @use_gridsearch.setter
    def use_gridsearch(self, use_gridsearch):
        self._cli_use_gridsearch = use_gridsearch

    @property
    def csv_sep(self):
        """
        Return the csv_sep value as String.

        """

        return self._csv_sep

    @csv_sep.setter
    def csv_sep(self, csv_sep):
        self._csv_sep = csv_sep

    @property
    def force_cpu(self):
        """
        Return the force_cpu value as Boolean.

        """

        return self._force_cpu

    @force_cpu.setter
    def force_cpu(self, force_cpu):
        self._force_cpu = force_cpu

    @property
    def target_column(self):
        """
        Return the target_column value as String.

        """

        return self._target_column

    @target_column.setter
    def target_column(self, target_column):
        self._target_column = target_column
