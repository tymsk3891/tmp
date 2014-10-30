Imports System
Imports System.IO
Imports System.IO.Compression
Module Module1

    Sub Main()

        Dim gzFileName As String = Environment.GetCommandLineArgs.GetValue(1).ToString()
        Dim gzFileToDecompress As FileInfo = New FileInfo(gzFileName)

        Dim decompressedFile As FileInfo = compressGzip(gzFileToDecompress)
        replaceLFtoCRLF(decompressedFile)

    End Sub


    Private Function compressGzip(ByVal gzFileToDecompress As FileInfo) As FileInfo

        Using gzFileStream As FileStream = gzFileToDecompress.OpenRead()
            Dim gzFileName As String = gzFileToDecompress.FullName
            Dim newFileName = gzFileName.Remove(gzFileName.Length - gzFileToDecompress.Extension.Length)

            Using decompressedFileStream As FileStream = File.Create(newFileName)
                Using decompressionStream As GZipStream = New GZipStream(gzFileStream, CompressionMode.Decompress)
                    decompressionStream.CopyTo(decompressedFileStream)
                End Using
            End Using
            Return New FileInfo(newFileName)
        End Using

    End Function


    Private Sub replaceLFtoCRLF(ByVal decompressedFile As FileInfo)

        Dim fileReader As String
        fileReader = My.Computer.FileSystem.ReadAllText(decompressedFile.FullName)
        fileReader = fileReader.Replace(ControlChars.Lf, ControlChars.CrLf)

        Using outfile As New StreamWriter(decompressedFile.FullName & ".new")
            outfile.Write(fileReader.ToString())
        End Using

    End Sub

End Module
