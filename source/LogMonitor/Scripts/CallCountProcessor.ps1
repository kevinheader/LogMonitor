Function MetricProcessor ([LogMonitor.FileChange] $change)
{
    If (!$change)
    {
        Throw "No change specified."
    }
        
    $metrics = @()
        
    if ($change.GetType().FullName -eq "LogMonitor.Processors.W3CChange")
    {
		$metrics += [LogMonitor.Metric]::Create('calls', $change.Values.Count, [LogMonitor.MetricType]::Counter)
    }
        
    return $metrics
}