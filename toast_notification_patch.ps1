# Toast Notification for Windows 10/11 - Visible for 60 seconds
[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null

# Create the toast template
$template = [Windows.UI.Notifications.ToastTemplateType]::ToastText02
$xml = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent($template)

# Set duration to "long" (approx. 25 seconds max on Windows) – we'll handle the 60s effect manually
$toastNode = $xml.SelectSingleNode("/toast")
$toastNode.SetAttribute("duration", "long")

# Add the text content
$toastTextElements = $xml.GetElementsByTagName("text")
$toastTextElements.Item(0).AppendChild($xml.CreateTextNode("Monthly Windows Patching Notice")) | Out-Null
$toastTextElements.Item(1).AppendChild($xml.CreateTextNode("Reminder that you will be prompted to reboot your computer this week to complete the updates.")) | Out-Null

# Create and show the toast
$notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier("Company Name")
$toast = [Windows.UI.Notifications.ToastNotification]::new($xml)
$notifier.Show($toast)

# Wait 60 seconds before script ends (the toast itself disappears sooner — see note below)
Start-Sleep -Seconds 60
