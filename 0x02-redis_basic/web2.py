#!/usr/bin/env python3

import redis
import requests
from functools import wraps

r = redis.Redis()

def url_access_count(method):
    """Decorator for get_page function."""
    @wraps(method)
    def wrapper(url: str) -> str:
        """Wrapper function to cache and track URL access count."""
        key = f"cached:{url}"
        cached_value = r.get(key)
        if cached_value:
            return cached_value.decode("utf-8")

        # Get new content and update cache
        key_count = f"count:{url}"
        html_content = method(url)

        r.incr(key_count)
        r.set(key, html_content, ex=10)
        r.expire(key, 10)
        return html_content
    return wrapper

@url_access_count
def get_page(url: str) -> str:
    """Obtain the HTML content of a particular URL.

    Args:
        url (str): The URL to fetch the HTML content from.

    Returns:
        str: The HTML content of the given URL.
    """
    results = requests.get(url)
    return results.text

if __name__ == "__main__":
    # Test the get_page function
    url = 'http://slowwly.robertomurray.co.uk'
    html_content = get_page(url)
    print(f"HTML Content of {url}:")
    print(html_content)
