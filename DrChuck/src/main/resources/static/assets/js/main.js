$(document).ready(function () {

    function motionScroll(element, settings) {
        var _ = this;

        // 커스텀 가능한 기본 옵션
        _.defaults = {
            aniWrapper: $(element),
            pages: $('.page_scroll'), /* {element} 스크롤 대상 페이지 */
            navs: $('.list_nav .link_nav'), /* {element} 스크롤 네비게이션 링크 */
            navsParent: $('.list_nav li'), /* {element} 스크롤 네비게이션 링크의 부모 */
            btnScroll: $('.btn_scroll'), /* {element} 다음 페이지로 이동시켜주는 스크롤 버튼 */
            onClass: 'on', /* {string} 스크롤 네비게이션 활성 시 붙는 클래스. 네비게이션 링크의 부모에 추가됨. */
            headH: 86, /* {number} 페이지 상단에 붙는 fixed 헤더 높이값 */
            scrollSpeed: 500 /* {number} 스크롤 속도 */
        }

        // 플러그인 내부에서 사용하는 변수
        _.initials = {
            winHeight: 0,
            aniWrapper: null,
            pages: null,
            navs: null,
            windowLoad: false,
            currentPage: 0,
            stepCountAll: 0,
            stepAllIdx: 0,
            pagesOffset: [],
            isGnbScroll: false
        }

        $.extend(_, _.initials);
        _.options = $.extend({}, _.defaults, settings);

        // 옵션을 내부변수에 맵핑
        _.aniWrapper = _.options.aniWrapper;
        _.pages = _.options.pages;
        _.navs = _.options.navs;
        _.navsParent = _.options.navsParent;
        _.btnScroll = _.options.btnScroll;
        _.headH = _.options.headH;
        _.scrollSpeed = _.options.scrollSpeed;
        _.stepCountAll = _.pages.length;
        _.stepAllIdx = _.stepCountAll - 1;

        // window: load
        $(window).load(function () {
            _.windowLoad = true;
            _.winHeight = $(window).height();
            _.winScrollTop = $(window).scrollTop();
            _.getOffsetArr();
        });

        // window: resize
        $(window).resize(function () {
            _.getOffsetArr();
        });

        // window: scroll
        $(window).scroll(function () {
            if (!_.windowLoad) return false;
            _.winScrollTop = $(window).scrollTop();
            _.scrollAni();
        });

        // 매뉴 클릭
        _.navs.click(function (event) {
            var _idx = $(this).data('page');
            event.preventDefault();
            _.pageAni(_idx);
        });

        // 스크롤 버튼 클릭
        _.btnScroll.click(function (event) {
            event.preventDefault();
            _.pageAni(1);
        });
    };

    // 애니메이션 실행
    motionScroll.prototype.pageAni = function (_idx, _pos) {
        var _ = this;
        var _pos = _pos ? _pos : 0;

        if (_.isGnbScroll) return true;

        _.isGnbScroll = true;
        _.pagingAni(_idx);

        if (_pos) {
            $('html,body').animate({ scrollTop: _pos }, _.scrollSpeed);
        } else {
            $('html,body').animate({ scrollTop: _.pagesOffset[_idx] }, _.scrollSpeed);
        }

        setTimeout(function () {
            _.isGnbScroll = false;
        }, _.scrollSpeed + 10)
    }

    // 스크롤 시 발생하는 애니메이션
    motionScroll.prototype.scrollAni = function () {
        var _ = this,
            _winPos = _.winScrollTop,
            _winH = _.winHeight,
            i;

        if (!_.isGnbScroll) {
            for (i = 0; i < _.stepCountAll; i++) {
                if (_winPos < _.pagesOffset[i + 1] && _.pagesOffset[i] < _winPos) {
                    _.pagingAni(i);
                } else if (_winPos + (_winH * 0.5) > _.pagesOffset[_.stepAllIdx]) {
                    _.pagingAni(_.stepAllIdx);
                }
            }
        }
        return false;
    }

    // 페이지 오프셋 구하기
    motionScroll.prototype.getOffsetArr = function (delta) {
        var _ = this,
            i;
        _.pagesOffset = [];

        for (i = 0; i < _.stepCountAll; i++) {
            var _temp = _.pages.eq(i).offset().top - _.headH;
            _.pagesOffset.push(_temp);
        }

        return _.pagesOffset;
    }

    // 페이징
    motionScroll.prototype.pagingAni = function (idx) {
        var _ = this;
        _.navsParent.removeClass(_.options.onClass);
        _.navsParent.eq(idx).addClass(_.options.onClass);
    }

    // jquery 플러그인으로 생성
    $.fn.motionScroll = function () {
        var _ = this,
            opt = arguments[0],
            l = _.length,
            i;

        for (i = 0; i < l; i++) {
            if (typeof opt == 'object' || typeof opt == 'undefined') {
                _[i].motionScroll = new motionScroll(_[i], opt);
            }
        }
        return _;
    }

    // 모션 실행
    $('.prm_promo').motionScroll();
});

// 사진 업로드
function previewImage(input, imageId) {
    const imagePreview = document.getElementById(imageId);
    const uploadLabel = input.closest('.image-upload'); // 'custom-file-upload' 대신 'image-upload'

    if (input.files && input.files[0]) {
        const reader = new FileReader();

        reader.onload = function (e) {
            imagePreview.src = e.target.result;
            // Add 'uploaded' class to the label
            uploadLabel.classList.add('uploaded');
        };

        reader.readAsDataURL(input.files[0]);
    } else {
        imagePreview.src = '';
        // Remove 'uploaded' class from the label
        uploadLabel.classList.remove('uploaded');
    }
}

//기본 꺽은 선형 차트
var ctx2 = document.getElementById("myChart2");
var myLineChart2 = new Chart(ctx2, {
    type: 'line',
    data: {
     labels: ["2023.01", "2023.02", "2023.04", "2023.05", "2023.06", "2023.07", "2023.08"],
     datasets: [{
      label: '좋은 자세',
      data: [10,20,30,40,50,60,60],
      borderColor: [
                 'green',//green
               ]            
     },
     {
      label: '나쁜 자세',
      data: [80,70,65,30,20,40,70],
      borderColor: [
                 'red',//red
               ]            
     }]
    },
    options: {
        scales: {
            yAxes: [{
                stacked: true
            }]
        }
    }
});


 

new Chart(document.getElementById("pie-chart"), {
  type: 'pie',
  data: {
    labels: ["스탠드", "다수","자리비움"],
    datasets: [{
      label: "Population (millions)",
      backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
      data: [734,784,43]
    }]
  },
  options: {
    title: {
      display: true,
      text: 'Predicted world population (millions) in 2050'
    }
  }
});

// 소개 바탕
$(function() {

    var currentImageIndex = -1,
        images = $('.slider img'), 
        imageCount = images.length;
 
    function cycleImages() {
       var nextImageIndex = (currentImageIndex + 1) % imageCount;
 
       images.eq(currentImageIndex).animate({left:'-=100%'},1000,function(){
          $(this).css('left','100%').hide();
       });
 
       images.eq(nextImageIndex).show().css('left','100%').animate({left:'-=100%'},1000);
 
       currentImageIndex = nextImageIndex;
    }
 
    setInterval(cycleImages, 3000);
 
 });
 

 //upload
 var $profileImgDiv = document.getElementById("profile-img-div"),
    $profileImg = document.getElementById("profile-img"),
    $changePhoto = document.getElementById("change-photo"),
    $xPosition = document.getElementById("x-position"),
    $yPosition = document.getElementById("y-position"),
    $saveImg = document.getElementById("save-img"),
    $loader = document.getElementById("loader"),
    $cancelImg = document.getElementById("cancel-img"),
    $profileImgInput = document
      .getElementById("profile-img-input"),
    $profileImgConfirm = document
      .getElementById("profile-img-confirm"),
    $error = document.getElementById("error");

var currentProfileImg = "",
    profileImgDivW = getSizes($profileImgDiv).elW,
    NewImgNatWidth = 0,
    NewImgNatHeight = 0,
    NewImgNatRatio = 0,
    NewImgWidth = 0,
    NewImgHeight = 0,
    NewImgRatio = 0,
    xCut = 0,
    yCut = 0;

makeSquared($profileImgDiv);

$changePhoto.addEventListener("change", function() {
  currentProfileImg = $profileImg.src;
  showPreview(this, $profileImg);
  $loader.style.width = "100%";
  $profileImgInput.style.display = "none";
  $profileImgConfirm.style.display = "flex";
  $error.style.display = "none";
});

$xPosition.addEventListener("input", function() {
  $profileImg.style.left = -this.value + "px";
  xCut = this.value;
  yCut = 0;
});

$yPosition.addEventListener("input", function() {
  $profileImg.style.top = -this.value + "px";
  yCut = this.value;
  xCut = 0;
});

$saveImg.addEventListener("click", function() {
  cropImg($profileImg);
  resetAll(true);
});

$cancelImg.addEventListener("click", function() {
  resetAll(false);
});

window.addEventListener("resize", function() {
  makeSquared($profileImgDiv);
  profileImgDivW = getSizes($profileImgDiv).elW;
});

function makeSquared(el) {
  var elW = el.clientWidth;
  el.style.height = elW + "px";
}

function showPreview(input, el) {
  var reader = new FileReader();
  reader.readAsDataURL(input.files[0]);
  if (input.files && input.files[0]) {
    reader.onload = function(e) {
      setTimeout(function() {
        el.src = e.target.result;
      }, 300);

      var poll = setInterval(function() {
        if (el.naturalWidth && el.src != currentProfileImg) {
          clearInterval(poll);
          setNewImgSizes(el);
          setTimeout(function() {
            $loader.style.width = "0%";
            $profileImg.style.opacity = "1";
          }, 1000);
        }
      }, 100);
    };
  } else {
    return;
  }
}

function setNewImgSizes(el) {
  if (getNatSizes(el).elR > 1) {
    el.style.width = "auto";
    el.style.height = "100%";
    newImgWidth = getSizes(el).elW;
    $xPosition.style.display = "block";
    $yPosition.style.display = "none";
    $xPosition.max = newImgWidth - profileImgDivW;
  } else if (getNatSizes(el).elR < 1) {
    el.style.width = "100%";
    el.style.height = "auto";
    newImgHeight = getSizes(el).elH;
    $xPosition.style.display = "none";
    $yPosition.style.display = "block";
    $yPosition.max = newImgHeight - profileImgDivW;
  } else if (getNatSizes(el).elR == 1) {
    el.style.width = "100%";
    el.style.height = "100%";
    $xPosition.style.display = "none";
    $yPosition.style.display = "none";
  }
}

function getNatSizes(el) {
  var elW = el.naturalWidth,
    elH = el.naturalHeight,
    elR = elW / elH;
  return {
    elW: elW,
    elH: elH,
    elR: elR
  };
}

function getSizes(el) {
  var elW = el.clientWidth,
    elH = el.clientHeight,
    elR = elW / elH;
  return {
    elW: elW,
    elH: elH,
    elR: elR
  };
}

function cropImg(el) {
  var natClientImgRatio = getNatSizes(el).elW / getSizes(el).elW;
  (myCanvas = document.getElementById("croppedPhoto")),
    (ctx = myCanvas.getContext("2d"));
  ctx.fillStyle = "#ffffff";
  ctx.fillRect(0, 0, 400, 400);
  ctx.drawImage(
    el,
    xCut * natClientImgRatio,
    yCut * natClientImgRatio,
    profileImgDivW * natClientImgRatio,
    profileImgDivW * natClientImgRatio,
    0,
    0,
    400,
    400
  );
  var newProfileImgUrl = myCanvas.toDataURL("image/jpeg");
  $profileImg.src = newProfileImgUrl;
}

function resetAll(confirm) {
  if (!confirm) {
    $profileImg.src = currentProfileImg;
  }
  $changePhoto.value = "";
  $profileImgInput.style.display = "block";
  $profileImgConfirm.style.display = "none";
  $profileImg.style.left = "0";
  $profileImg.style.top = "0";
  $profileImg.style.width = "100%";
  $profileImg.style.height = "100%";
  $xPosition.style.display = "none";
  $yPosition.style.display = "none";
  $xPosition.value = "0";
  $yPosition.value = "0";
  xCut = "0";
  yCut = "0";
}

function checkMinSizes(el) {
  if (getNatSizes(el).elW > 400 && getNatSizes(el).elH > 400) {
    return true;
  } else {
    return false;
  }
}

//로딩
$(document).ready(function () {

  function motionScroll(element, settings) {
      var _ = this;

      // 커스텀 가능한 기본 옵션
      _.defaults = {
          aniWrapper: $(element),
          pages: $('.page_scroll'), /* {element} 스크롤 대상 페이지 */
          navs: $('.list_nav .link_nav'), /* {element} 스크롤 네비게이션 링크 */
          navsParent: $('.list_nav li'), /* {element} 스크롤 네비게이션 링크의 부모 */
          btnScroll: $('.btn_scroll'), /* {element} 다음 페이지로 이동시켜주는 스크롤 버튼 */
          onClass: 'on', /* {string} 스크롤 네비게이션 활성 시 붙는 클래스. 네비게이션 링크의 부모에 추가됨. */
          headH: 86, /* {number} 페이지 상단에 붙는 fixed 헤더 높이값 */
          scrollSpeed: 500 /* {number} 스크롤 속도 */
      }

      // 플러그인 내부에서 사용하는 변수
      _.initials = {
          winHeight: 0,
          aniWrapper: null,
          pages: null,
          navs: null,
          windowLoad: false,
          currentPage: 0,
          stepCountAll: 0,
          stepAllIdx: 0,
          pagesOffset: [],
          isGnbScroll: false
      }

      $.extend(_, _.initials);
      _.options = $.extend({}, _.defaults, settings);

      // 옵션을 내부변수에 맵핑
      _.aniWrapper = _.options.aniWrapper;
      _.pages = _.options.pages;
      _.navs = _.options.navs;
      _.navsParent = _.options.navsParent;
      _.btnScroll = _.options.btnScroll;
      _.headH = _.options.headH;
      _.scrollSpeed = _.options.scrollSpeed;
      _.stepCountAll = _.pages.length;
      _.stepAllIdx = _.stepCountAll - 1;

      // window: load
      $(window).load(function () {
          _.windowLoad = true;
          _.winHeight = $(window).height();
          _.winScrollTop = $(window).scrollTop();
          _.getOffsetArr();
      });

      // window: resize
      $(window).resize(function () {
          _.getOffsetArr();
      });

      // window: scroll
      $(window).scroll(function () {
          if (!_.windowLoad) return false;
          _.winScrollTop = $(window).scrollTop();
          _.scrollAni();
      });

      // 매뉴 클릭
      _.navs.click(function (event) {
          var _idx = $(this).data('page');
          event.preventDefault();
          _.pageAni(_idx);
      });

      // 스크롤 버튼 클릭
      _.btnScroll.click(function (event) {
          event.preventDefault();
          _.pageAni(1);
      });
  };

  // 애니메이션 실행
  motionScroll.prototype.pageAni = function (_idx, _pos) {
      var _ = this;
      var _pos = _pos ? _pos : 0;

      if (_.isGnbScroll) return true;

      _.isGnbScroll = true;
      _.pagingAni(_idx);

      if (_pos) {
          $('html,body').animate({ scrollTop: _pos }, _.scrollSpeed);
      } else {
          $('html,body').animate({ scrollTop: _.pagesOffset[_idx] }, _.scrollSpeed);
      }

      setTimeout(function () {
          _.isGnbScroll = false;
      }, _.scrollSpeed + 10)
  }

  // 스크롤 시 발생하는 애니메이션
  motionScroll.prototype.scrollAni = function () {
      var _ = this,
          _winPos = _.winScrollTop,
          _winH = _.winHeight,
          i;

      if (!_.isGnbScroll) {
          for (i = 0; i < _.stepCountAll; i++) {
              if (_winPos < _.pagesOffset[i + 1] && _.pagesOffset[i] < _winPos) {
                  _.pagingAni(i);
              } else if (_winPos + (_winH * 0.5) > _.pagesOffset[_.stepAllIdx]) {
                  _.pagingAni(_.stepAllIdx);
              }
          }
      }
      return false;
  }

  // 페이지 오프셋 구하기
  motionScroll.prototype.getOffsetArr = function (delta) {
      var _ = this,
          i;
      _.pagesOffset = [];

      for (i = 0; i < _.stepCountAll; i++) {
          var _temp = _.pages.eq(i).offset().top - _.headH;
          _.pagesOffset.push(_temp);
      }

      return _.pagesOffset;
  }

  // 페이징
  motionScroll.prototype.pagingAni = function (idx) {
      var _ = this;
      _.navsParent.removeClass(_.options.onClass);
      _.navsParent.eq(idx).addClass(_.options.onClass);
  }

  // jquery 플러그인으로 생성
  $.fn.motionScroll = function () {
      var _ = this,
          opt = arguments[0],
          l = _.length,
          i;

      for (i = 0; i < l; i++) {
          if (typeof opt == 'object' || typeof opt == 'undefined') {
              _[i].motionScroll = new motionScroll(_[i], opt);
          }
      }
      return _;
  }

  // 모션 실행
  $('.prm_promo').motionScroll();
});

// 사진 업로드
function previewImage(input, imageId) {
  const imagePreview = document.getElementById(imageId);
  const uploadLabel = input.closest('.image-upload'); // 'custom-file-upload' 대신 'image-upload'

  if (input.files && input.files[0]) {
      const reader = new FileReader();

      reader.onload = function (e) {
          imagePreview.src = e.target.result;
          // Add 'uploaded' class to the label
          uploadLabel.classList.add('uploaded');
      };

      reader.readAsDataURL(input.files[0]);
  } else {
      imagePreview.src = '';
      // Remove 'uploaded' class from the label
      uploadLabel.classList.remove('uploaded');
  }
}


//기본 꺽은 선형 차트
var ctx2 = document.getElementById("myChart2");
var myLineChart2 = new Chart(ctx2, {
  type: 'line',
  data: {
   labels: ["2023.01", "2023.02", "2023.04", "2023.05", "2023.06", "2023.07", "2023.08"],
   datasets: [{
    label: '좋은 자세',
    data: [10,20,30,40,50,60,60],
    borderColor: [
               'green',//green
             ]            
   },
   {
    label: '나쁜 자세',
    data: [80,70,65,30,20,40,70],
    borderColor: [
               'red',//red
             ]            
   }]
  },
  options: {
      scales: {
          yAxes: [{
              stacked: true
          }]
      }
  }
});




new Chart(document.getElementById("pie-chart"), {
type: 'pie',
data: {
  labels: ["스탠드", "다수","자리비움"],
  datasets: [{
    label: "Population (millions)",
    backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
    data: [734,784,43]
  }]
},
options: {
  title: {
    display: true,
    text: 'Predicted world population (millions) in 2050'
  }
}
});

// 소개 바탕
$(function() {

  var currentImageIndex = -1,
      images = $('.slider img'), 
      imageCount = images.length;

  function cycleImages() {
     var nextImageIndex = (currentImageIndex + 1) % imageCount;

     images.eq(currentImageIndex).animate({left:'-=100%'},1000,function(){
        $(this).css('left','100%').hide();
     });

     images.eq(nextImageIndex).show().css('left','100%').animate({left:'-=100%'},1000);

     currentImageIndex = nextImageIndex;
  }

  setInterval(cycleImages, 3000);

});


//upload
var $profileImgDiv = document.getElementById("profile-img-div"),
  $profileImg = document.getElementById("profile-img"),
  $changePhoto = document.getElementById("change-photo"),
  $xPosition = document.getElementById("x-position"),
  $yPosition = document.getElementById("y-position"),
  $saveImg = document.getElementById("save-img"),
  $loader = document.getElementById("loader"),
  $cancelImg = document.getElementById("cancel-img"),
  $profileImgInput = document
    .getElementById("profile-img-input"),
  $profileImgConfirm = document
    .getElementById("profile-img-confirm"),
  $error = document.getElementById("error");

var currentProfileImg = "",
  profileImgDivW = getSizes($profileImgDiv).elW,
  NewImgNatWidth = 0,
  NewImgNatHeight = 0,
  NewImgNatRatio = 0,
  NewImgWidth = 0,
  NewImgHeight = 0,
  NewImgRatio = 0,
  xCut = 0,
  yCut = 0;

makeSquared($profileImgDiv);

$changePhoto.addEventListener("change", function() {
currentProfileImg = $profileImg.src;
showPreview(this, $profileImg);
$loader.style.width = "100%";
$profileImgInput.style.display = "none";
$profileImgConfirm.style.display = "flex";
$error.style.display = "none";
});

$xPosition.addEventListener("input", function() {
$profileImg.style.left = -this.value + "px";
xCut = this.value;
yCut = 0;
});

$yPosition.addEventListener("input", function() {
$profileImg.style.top = -this.value + "px";
yCut = this.value;
xCut = 0;
});

$saveImg.addEventListener("click", function() {
cropImg($profileImg);
resetAll(true);
});

$cancelImg.addEventListener("click", function() {
resetAll(false);
});

window.addEventListener("resize", function() {
makeSquared($profileImgDiv);
profileImgDivW = getSizes($profileImgDiv).elW;
});

function makeSquared(el) {
var elW = el.clientWidth;
el.style.height = elW + "px";
}

function showPreview(input, el) {
var reader = new FileReader();
reader.readAsDataURL(input.files[0]);
if (input.files && input.files[0]) {
  reader.onload = function(e) {
    setTimeout(function() {
      el.src = e.target.result;
    }, 300);

    var poll = setInterval(function() {
      if (el.naturalWidth && el.src != currentProfileImg) {
        clearInterval(poll);
        setNewImgSizes(el);
        setTimeout(function() {
          $loader.style.width = "0%";
          $profileImg.style.opacity = "1";
        }, 1000);
      }
    }, 100);
  };
} else {
  return;
}
}

function setNewImgSizes(el) {
if (getNatSizes(el).elR > 1) {
  el.style.width = "auto";
  el.style.height = "100%";
  newImgWidth = getSizes(el).elW;
  $xPosition.style.display = "block";
  $yPosition.style.display = "none";
  $xPosition.max = newImgWidth - profileImgDivW;
} else if (getNatSizes(el).elR < 1) {
  el.style.width = "100%";
  el.style.height = "auto";
  newImgHeight = getSizes(el).elH;
  $xPosition.style.display = "none";
  $yPosition.style.display = "block";
  $yPosition.max = newImgHeight - profileImgDivW;
} else if (getNatSizes(el).elR == 1) {
  el.style.width = "100%";
  el.style.height = "100%";
  $xPosition.style.display = "none";
  $yPosition.style.display = "none";
}
}

function getNatSizes(el) {
var elW = el.naturalWidth,
  elH = el.naturalHeight,
  elR = elW / elH;
return {
  elW: elW,
  elH: elH,
  elR: elR
};
}

function getSizes(el) {
var elW = el.clientWidth,
  elH = el.clientHeight,
  elR = elW / elH;
return {
  elW: elW,
  elH: elH,
  elR: elR
};
}

function cropImg(el) {
var natClientImgRatio = getNatSizes(el).elW / getSizes(el).elW;
(myCanvas = document.getElementById("croppedPhoto")),
  (ctx = myCanvas.getContext("2d"));
ctx.fillStyle = "#ffffff";
ctx.fillRect(0, 0, 400, 400);
ctx.drawImage(
  el,
  xCut * natClientImgRatio,
  yCut * natClientImgRatio,
  profileImgDivW * natClientImgRatio,
  profileImgDivW * natClientImgRatio,
  0,
  0,
  400,
  400
);
var newProfileImgUrl = myCanvas.toDataURL("image/jpeg");
$profileImg.src = newProfileImgUrl;
}

function resetAll(confirm) {
if (!confirm) {
  $profileImg.src = currentProfileImg;
}
$changePhoto.value = "";
$profileImgInput.style.display = "block";
$profileImgConfirm.style.display = "none";
$profileImg.style.left = "0";
$profileImg.style.top = "0";
$profileImg.style.width = "100%";
$profileImg.style.height = "100%";
$xPosition.style.display = "none";
$yPosition.style.display = "none";
$xPosition.value = "0";
$yPosition.value = "0";
xCut = "0";
yCut = "0";
}

function checkMinSizes(el) {
if (getNatSizes(el).elW > 400 && getNatSizes(el).elH > 400) {
  return true;
} else {
  return false;
}
}

function clickedBtn() {
  console.log('clickedBtn function called');
  showLoading();
  setTimeout(function() {
      console.log('Timeout function called in clickedBtn');
      hideLoading();
      document.getElementById('modalContainer').classList.remove('hidden');

      // 이벤트 리스너 추가
      const closeModal = document.getElementById('closeModal');
      closeModal.addEventListener('click', () => {
          document.getElementById('modalContainer').classList.add('hidden');
      });
  }, 5000);
}
function showLoading(){
  console.log('showLoading function called');
  var maskHeight = $(document).height();
  var maskWidth  = window.document.body.clientWidth;

  var mask ="<div id='mask' style='position:absolute; z-index:10000; background-color:#000000; left:0; top:0;'></div>";

  $('body').append(mask)

  $('#mask').css({
      'width' : maskWidth,
      'height': maskHeight,
      'opacity' :'0.7'
  });

  $("#roadingStatus").show();
}

function hideLoading(){
  console.log('hideLoading function called');
  $("#mask").remove();
  $("#roadingStatus").hide();
}


const closeModal = document.getElementById('closeModal');

closeModal.addEventListener('click', () => {
    location.reload();
});
