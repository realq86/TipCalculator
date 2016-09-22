# Pre-work - TipCalculator

TipCalculator is a tip calculator application for iOS.

Submitted by: Michael Ting

Time spent: 7 hours spent in total for the current version

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [X] UI animations
* [X] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [X] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:
* [X] Autolayout in Storyboard so design remain consistent in landscape mode.

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

- Manipulating UINavigation Bar and associated items remain confusing in storyboard.
- Because the app has such simple UI elements, it became challenge to have striking design.  As typography and color choices are not my strengths.
- Deciding on the architecture of the UIView to meet the min requirement for 1st submission under time pressure yet extendable for future iteration.

## License

    Copyright [2016] [Chi Hwa Michael Ting]

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.



##More
CREDIT: Thanks to Daniel McGlaughlin, for the masterful design tips on color and fonts.

This is my first attempt at the CoderPath's iOS bootcamp application pre-work "iOS Pre-work: Tip Calculator App."
This project is following the instruction found at this link: https://courses.codepath.com/snippets/intro_to_ios/prework.md

The current version follows the instruction as closely as possible and use variations to my own style only on parts where the instructions were not specifc on what is required.

BASIC FEATURES:

Main calculator view that accepts 2 user inputs: 
  - Total amount of the bill.
  - Level of tip to be paid out of 3 choices.
Settings view that allows the user to choose 1 of 3 tip level to be saved into local storage as the default for the main calculator view.
Setting default values in the correct time of the View Controller Life Cycle.

OPTIONAL FEATURES:

Autolayout for all the views.
UIAnimation to change the alpha values of the tips and total amount field before and after user inputs the bill amount.

![alt tag](https://cloud.githubusercontent.com/assets/5937001/18765684/9fe41be0-80cb-11e6-8afe-4f0e798b0042.gif)
