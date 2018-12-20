[CmdletBinding(SupportsShouldProcess=$true)]
param()

begin
{
    $ConsoleConfiguration = @(
        @{Name='ScreenColors';Type='dword';Value='0x0000008f'}
        @{Name='PopupColors';Type='dword';Value='0x000000f8'}
        @{Name='ColorTable00';Type='dword';Value='0x00000000'}
        @{Name='ColorTable01';Type='dword';Value='0x00b38102'}
        @{Name='ColorTable02';Type='dword';Value='0x001f9970'}
        @{Name='ColorTable03';Type='dword';Value='0x00a39446'}
        @{Name='ColorTable04';Type='dword';Value='0x002d1bb3'}
        @{Name='ColorTable05';Type='dword';Value='0x00521bb3'}
        @{Name='ColorTable06';Type='dword';Value='0x00166bb3'}
        @{Name='ColorTable07';Type='dword';Value='0x00647572'}
        @{Name='ColorTable08';Type='dword';Value='0x00222827'}
        @{Name='ColorTable09';Type='dword';Value='0x00fcb603'}
        @{Name='ColorTable10';Type='dword';Value='0x002ee2a6'}
        @{Name='ColorTable11';Type='dword';Value='0x00efd966'}
        @{Name='ColorTable12';Type='dword';Value='0x003f26f9'}
        @{Name='ColorTable13';Type='dword';Value='0x007226f9'}
        @{Name='ColorTable14';Type='dword';Value='0x001f97fd'}
        @{Name='ColorTable15';Type='dword';Value='0x00f2f8f8'}
        @{Name='InsertMode';Type='dword';Value='0x00000001'}
        @{Name='QuickEdit';Type='dword';Value='0x00000001'}
        @{Name='ScreenBufferSize';Type='dword';Value='0x03e7007d'}
        @{Name='WindowSize';Type='dword';Value='0x0028007d'}
        @{Name='FontSize';Type='dword';Value='0x00110000'}
        @{Name='FontFamily';Type='dword';Value='0x00000036'}
        @{Name='FontWeight';Type='dword';Value='0x00000190'}
        @{Name='FaceName';Type='string';Value='Consolas'}
        @{Name='CursorSize';Type='dword';Value='0x00000019'}
        @{Name='HistoryBufferSize';Type='dword';Value='0x00000063'}
        @{Name='NumberOfHistoryBuffers';Type='dword';Value='0x00000004'}
        @{Name='HistoryNoDup';Type='dword';Value='0x00000001'}
        @{Name='FullScreen';Type='dword';Value='0x00000000'}
        @{Name='ScrollScale';Type='dword';Value='0x00000001'}
        @{Name='ExtendedEditKeyCustom';Type='dword';Value='0x00000000'}
        @{Name='TrimLeadingZeros';Type='dword';Value='0x00000000'}
        @{Name='LoadConIme';Type='dword';Value='0x00000001'}
        @{Name='WordDelimiters';Type='dword';Value='0x00000000'}
        @{Name='EnableColorSelection';Type='dword';Value='0x00000000'}
        @{Name='ExtendedEditKey';Type='dword';Value='0x00000000'}
        @{Name='CurrentPage';Type='dword';Value='0x00000001'}
        @{Name='CurrentPage';Type='dword';Value='0x00000001'}
    )

    # The basic path is kept out of $ConsoleVersions to extend to other users down the road.
    $BasicPath = 'HKCU:\'
    $ConsoleVersions = @(
        @{name='default';path='Console'}
        @{name='PowerShell';path='Console\%SystemRoot%_System32_WindowsPowerShell_v1.0_powershell.exe'}
        @{name='PowerShell32';path='Console\%SystemRoot%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe'}
    )
}


process
{
    foreach ($Console in $ConsoleVersions)
    {
        $Path = Join-Path -Path $BasicPath -ChildPath $Console.path
        if($PSCmdlet.ShouldProcess(('{0} console' -f $Console.name),'Applying theme'))
        {
            foreach ( $setting in $ConsoleConfiguration )
            {
                $setting += @{Path=$path}
                Set-ItemProperty @setting
            }
        }
    }
}
