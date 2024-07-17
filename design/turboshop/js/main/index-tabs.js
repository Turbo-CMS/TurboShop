const ajaxRequest = function (url, context) {
	const xhr = new XMLHttpRequest();
	xhr.open("GET", url);
	xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
	xhr.send();

	xhr.onload = function () {
		context.classList.remove("loading-state");
		if (xhr.status !== 200) {
			context.innerHTML = "Error " + xhr.status + ": " + xhr.statusText;
		} else {
			context.innerHTML = xhr.responseText;
			initCountdown();
		}
	};

	xhr.onerror = function () {
		context.classList.remove("loading-state");
		context.innerHTML = "Error";
	};
};

const readyHandler = function () {
	document.addEventListener("click", function (e) {
		const $tab = e.target.closest(".element-list .tab-nav .tab-nav__item");

		if ($tab && !$tab.classList.contains("active")) {
			const $tabContainer = $tab.closest(".element-list");
			const $tabItems = $tabContainer.querySelectorAll(".tab-nav__item");
			const tabCode = $tab.dataset.code;
			const $curTab = $tabContainer.querySelector(".tab-content-block[data-code='" + tabCode + "']");

			$tabItems.forEach(item => item.classList.remove("active"));
			$tab.classList.add("active");

			$tabContainer.querySelectorAll(".tab-content-block").forEach(content => content.classList.remove("active"));
			$curTab.classList.add("active");

			if (!$tab.classList.contains("clicked")) {
				const url = $tab.dataset.action ? window.location.origin + $tab.dataset.action : window.location.href;

				ajaxRequest(url, $curTab);

				$tab.classList.add("clicked");
			} else {
				Turbo.onCustomEvent("onSetHeightBanner");
			}
		}
	});
};

document.addEventListener("DOMContentLoaded", readyHandler);

window.tabsInitOnReady = function (block) {
	$(".element-list[data-block_key='" + block + "'] .tab-nav-wrapper").scrollTab({
		tabs_wrapper: ".tab-nav",
		tab_item: ".tab-nav__item",
		offset: 8,
		outer_wrapper: ".element-list[data-block_key='" + block + "'] .index-block__title-wrapper",
	});
};
