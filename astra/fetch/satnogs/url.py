from urllib.parse import parse_qs, urlencode, urlparse, urlunparse


def parse_grafana_url(url: str) -> dict:
    parsed = urlparse(url)
    if not parsed.scheme or not parsed.netloc:
        raise ValueError(f"Invalid URL structure: {url}")

    query_params = parse_qs(parsed.query)
    return {
        "base_url": urlunparse(
            (parsed.scheme, parsed.netloc, parsed.path, "", "", "")
        ),
        "from": query_params.get("from", [""])[0],
        "to": query_params.get("to", [""])[0],
    }


def build_inspection_url(
    base_url: str,
    panel_id: str,
    time_from: str | None = None,
    time_to: str | None = None,
) -> str:
    if not (parsed := urlparse(base_url)).scheme or not parsed.netloc:
        raise ValueError(f"Invalid base URL structure: {base_url}")

    params = {
        **{
            k: v
            for k, v in parse_qs(parsed.query).items()
            if k.startswith("var-")
        },
    }
    if panel_id != "":
        params["inspect"] = [panel_id]
        params["inspectTab"] = ["data"]
        params["viewPanel"] = [panel_id]

    if time_from:
        params["from"] = [time_from]
    if time_to:
        params["to"] = [time_to]

    return urlunparse(
        (
            parsed.scheme,
            parsed.netloc,
            parsed.path,
            "",
            urlencode(params, doseq=True),
            "",
        )
    )
