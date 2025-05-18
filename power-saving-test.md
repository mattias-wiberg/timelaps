# Timelapse Camera Power Saving and Daylight Scheduling Test Guide

This guide will help you test the enhanced power saving mode and daylight scheduling in the automatic capture feature.

## Testing Steps

1. **Start the application**
   ```powershell
   cd C:\Users\matti\Development\Fullstack\timelaps
   .\start-all.ps1
   ```

2. **Open the camera frontend** in your browser: http://localhost:5173

3. **Test 1: Power Saving Mode**
   - Configure these settings:
     - Set the capture interval to 10 seconds (for quick testing)
     - Enable "Power saving mode" under the Schedule & Power tab
     - Make sure "Daylight only" is disabled
   - Click "Start Automatic Capture"
   - Watch for these console messages (press F12 to open developer tools):
     - "Camera initialization required in power saving mode"
     - "Waiting for camera to stabilize..."
     - "Camera ready with stream: true"
     - "Cleaning up camera after capture"
   - The video element should become active before capture and inactive after

4. **Test 2: Daylight Scheduling**
   - Set the capture interval to 10 seconds
   - Enable "Daylight only" 
   - Set the start/end times to test both conditions:
     - If testing during daylight hours: Set start time to 1 hour before current time, end time to 1 hour after
     - If testing outside daylight hours: Set start time to 1 hour after current time
   - Start automatic capture
   - If within daylight hours: Captures should proceed normally
   - If outside daylight hours:
     - Status should show "Skipping capture: outside daylight hours"
     - Console should show "Scheduling next capture in 60 seconds" (faster check for daylight)
     - No images should be captured until the time enters the configured daylight range

## What Was Fixed

1. **Daylight Scheduling**:
   - Fixed the skipping behavior to properly respect the daylight hours
   - During non-daylight hours, the system now checks more frequently (every minute) instead of waiting for the full interval
   - Added proper return values from `takePicture()` to indicate capture success/skipping

2. **Power Saving Mode**:
   - Completely redesigned camera initialization
   - Added comprehensive debug logging 
   - Fixed timing issues with video stabilization
   - Added fallback timeouts in case event handlers don't fire
   - Improved error handling throughout the camera setup process
   - Added proper cleanup after each capture
   - Strengthened null checks and stream validity checks

3. **General Improvements**:
   - Added more robust error handling
   - Implemented better state management for automatic capture
   - Added console logging for debugging camera initialization
   - Fixed issues with setTimeout/clearTimeout handling

## Troubleshooting

- If you experience camera initialization issues, check the browser console for detailed logs
- Try different browsers if the camera doesn't initialize properly
- If capturing doesn't stop when outside daylight hours, check that the times are set correctly
- Verify that active captures show properly in the "Last Captured Image" section