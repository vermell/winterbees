import asyncio

def foo(a):
    return 2 * a


async def run_foo():
    while True:
        await asyncio.sleep(1)
        print(f"Hello world...{foo(13)}")

if __name__ == '__main__':
    loop = asyncio.get_event_loop()
    loop.run_until_complete(run_foo())