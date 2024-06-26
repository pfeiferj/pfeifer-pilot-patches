# Always On Lateral Changelog

## 12/11/23
Openpilot:
    * Fix for hkg can-fd

## 12/06/23
Panda:
    * Untested Subaru pre-global support

## 12/01/23
Openpilot:
    * Large refactor to panda code. Greatly simplifies the lateral allowed checks.
    * Panda no longer has an alt experience flag for enabling upon main button press, it is default behavior now. all
      cars appear to be stable when enabling with main button press so a distinction is no longer needed.
    * Adds untested nissan support.
    * Removes aol type setting in openpilot code. All cars now use cruise available state. HKG with oplong tracks button
      presses but the button presses now set the cruise available state directly.
    * Openpilot code no longer explicitly specifies whether a car may use aol, nearly all cars are supported so the
      additional code is not needed.
    * HKG no longer maintains aol state across ignition cycles. aol will always default to off upon starting car.

## 10/30/23
Openpilot:
    * Fixes a bug that prevented any lateral control while aol was disabled (thanks for the heads up @nworby!)

## 10/14/23
Openpilot:
    * Disable lateral on blinker at low speed
    * Performance Improvements
    * Code cleanup

## 09/17/23
Panda:
    * Fix steer check for honda (should resolve honda aol not working)

## 08/23/23
Openpilot:
    * Disable lat on blinker only disables while op is not active

## 08/19/23
Openpilot:
    * Fixes an issue with setting the alt experience flag for main immediately
    enables always on lateral. (Thanks @jackal830 and @nworby for the find!)

## 08/16/23
Openpilot:
    * Improves safety by adding checks for soft disable and immediate disable
      events. (Once again a huge thanks goes out to @nworby for his attention to
      detail regarding safety!)

## 08/12/23
Panda:
    * Set lateral_controls_allowed in tests so safety tests can be run (thanks
      @nworby for the heads up!)

## 08/03/23
Panda:
    * Add missing comment block (thanks @nworby for the find!)

## 07/28/23
Openpilot:
    * Disable lateral whenever openpilot is not calibrated

## 07/28/23
Openpilot:
    * Add always\_on\_lateral.py to the release files list (thanks @nworby for
      the suggestion!)

## 07/07/23
Panda:
    * Remove lateral brake disable check from panda safety when AOL is enabled
      due to it being a temporary override rather than permanent disable.
    * Add an alt experience flag for immediately engaging lateral upon toggling
      cruise main on.
    * Fix for GM\_ASMC always on lateral: lateral\_controls\_allowed was not
      being set to false after the main cruise button was toggled off.

Openpilot:
    * Add a toggle for engaging lateral immediately upon main cruise being
      toggled on.
    * Add warning to test always on lateral in a safe environment upon enabling
      the setting.
    * Add warning to test engaging always on lateral upon cruise main being
      toggled in a safe environment upon enabling the setting.

## 07/01/23
Always On Lateral toggle is disabled when on-road.

## 06/30/23
* Untested support for VW/Audi/Skoda

## 06/16/23
* Rebrand to "Always On Lateral" as feature set isn't identical to "MADS"
* Now requires openpilot to be engaged at least once after main is toggled on
* Fixes for HKG stock long
* Untested support for the following vehicles:
    - Chrysler
    - Ford
    - GM
    - Honda
    - HKG can-fd
    - Mazda
    - Subaru
    - Tesla
    - Toyota

## 06/11/23
* Improved panda safety code that ensures stock behavior when the alt experience
  is not set.
* Raised the minimum lockout speed to try to reduce wheel pull when coming to a
  stop
* Uses /dev/shm for lateral\_allowed param to prevent lag. We still write
  lateral\_allowed to the regular params location for the ui but we use a
  nonblocking put as we now do not need it to be perfectly in sync when reading.

## 06/03/23
* Improved panda safety code that enforces the alt experience flag to be sent
  from openpilot.
* Added a disable at stopped speeds to prevent wheel twitching when stopped.
* Fixed issue preventing warnings from activating when lateral was on without long control on.
* Resolved merge conflicts with master
