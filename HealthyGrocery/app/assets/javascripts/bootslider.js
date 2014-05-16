/*
 * Copyright 2012 soundarapandian
 * Licensed under the Apache License, Version 2.0
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
$(document).ready(function() {
  function setFullScreen() {
    browserHeight = $(window).height();
    $("#full-screen-slider .carousel-inner .item img").css({
      height: browserHeight
    });
  }

  setFullScreen();

  $(window).resize(function() {
    setFullScreen();
  });

  $("#slider-fluid-banner").carousel({ interval: 7000 });
  $("#slider-fluid-products").carousel({ interval: 8000 });
  $("#slider-fixed-banner").carousel({ interval: 7000 });
  $("#slider-fixed-products").carousel({ interval: 8000 });
  $("#patnerSlider").carousel({ interval: 5000 });
});
