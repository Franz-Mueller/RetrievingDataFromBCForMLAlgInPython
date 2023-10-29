codeunit 50100 RunPythonScript
{
    trigger OnRun()
    var
        Process: DotNet "'System.Diagnostics.Process, System.Diagnostics.Process'";
        StartInfo: DotNet "'System.Diagnostics.ProcessStartInfo, System.Diagnostics.Process'";
    begin
        Process := Process.DotNetType.CreateInstance();
        StartInfo := StartInfo.DotNetType.CreateInstance();

        StartInfo.FileName := 'python';
        StartInfo.Arguments := '<path_to_your_python_script>';

        Process.StartInfo := StartInfo;
        Process.Start();
    end;
}
