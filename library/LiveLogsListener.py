import os 

import webbrowser

class LiveLogsListener:

    ROBOT_LISTENER_API_VERSION = 2

    def __init__(self):

        live_logs_file = open('LiveLogs.html','w')

        message = """
        <html>
            <head>
                <title>Live Logs</title>
                <meta http-equiv="refresh" content="5" >
                <style>
                    table {  
                        color: #333; /* Lighten up font color */
                        font-family: Consolas, Helvetica, Arial, sans-serif;
                        table-layout: fixed;
                        width: 100%;
                        font-size: 14px;
                    }

                    td, th { border: 1px solid #CCC; height: 30px; } /* Make cells a bit taller */

                    th {  
                        background: #F3F3F3; /* Light grey background */
                        font-weight: bold; /* Make sure they're bold */
                    }

                    td {  
                        background: #FAFAFA; /* Lighter grey background */
                        text-align: center; /* Center our text */
                        width: 100; 
                        /* css-3 */
                        white-space: -o-pre-wrap; 
                        word-wrap: break-word;
                        white-space: pre-wrap; 
                        white-space: -moz-pre-wrap; 
                        white-space: -pre-wrap;
                    }
                </style>
            </head>
            <body>
                <table>
                    <tr>
                        <th> >>>>> Generating Live Logs - Scroll Down for latest <<<<< </th>
                    </tr>
                </table>
                </br>
        </html>
        """

        live_logs_file.write(message)
        live_logs_file.close()

        current_dir = os.getcwd()
        filename =  current_dir + '/LiveLogs.html'

        webbrowser.open_new_tab(filename)

    def start_suite(self, name, attrs):
        self.test_count = len(attrs['tests'])

        if self.test_count != 0:

            live_logs_file = open('LiveLogs.html','a+')

            message = """
                <table>
                    <tr>
                        <th style="background-color:LIGHTSTEELBLUE">Suite (Tests)</th>
                        <th style="background-color:LIGHTSTEELBLUE">Test Name</th>
                        <th style="background-color:LIGHTSTEELBLUE">Test Status</th>
                        <th style="background-color:LIGHTSTEELBLUE">Message</th>
                        <th style="background-color:LIGHTSTEELBLUE">KW Name</th>
                        <th style="background-color:LIGHTSTEELBLUE">KW Status</th>
                    </tr>
                    <tr>
                        <td style="background-color:LAVENDER"><strong>%s (%s)</strong></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>

            """ %(str(name), str(self.test_count))

            live_logs_file.write(message)
            live_logs_file.close()
    
    def start_test(self, name, attrs):
        if self.test_count != 0:
            live_logs_file = open('LiveLogs.html','a+')

            message = """
                <table>
                    <tr>
                        <td></td>
                        <td style="background-color:LIGHTBLUE"><strong>%s</strong></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>

            """ %(str(name))

            live_logs_file.write(message)
            live_logs_file.close()
    
    def end_keyword(self, name, attrs):
        if self.test_count != 0:

            live_logs_file = open('LiveLogs.html','a+')

            message = """
                <table>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td style="text-align: left;">%s</td>
                        <td>%s</td>
                    </tr>
                </table>

            """ %(str(attrs['kwname']), str(attrs['status']))

            live_logs_file.write(message)
            live_logs_file.close()

    def end_test(self, name, attrs):
        if self.test_count != 0:
            live_logs_file = open('LiveLogs.html','a+')

            message = """
                <table>
                    <tr>
                        <td></td>
                        <td></td>
                        <td style="background-color:BEIGE"><strong>%s</strong></td>
                        <td style="text-align: left;">%s</td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>

            """ %(str(attrs['status']), str(attrs['message']))

            live_logs_file.write(message)
            live_logs_file.close()

    def end_suite(self, name, attrs):
        if self.test_count != 0:

            live_logs_file = open('LiveLogs.html','a+')
            message = """
                <table>
                    <tr>
                        <td style="background-color:LAVENDERBLUSH"><strong>%s</strong></td>
                        <td style="background-color:CORNSILK"><strong>%s</strong></td>
                    </tr>
                </table>
                </br>

            """ %(str(name),str(attrs['status']))

            live_logs_file.write(message)
            live_logs_file.close()

    def close(self):

        live_logs_file = open('LiveLogs.html','a+')
        message = """
            <table>
                <tr>
                    <th>Execution completed! </th>
                </tr>
            </table>
        """

        live_logs_file.write(message)
        live_logs_file.close()