import asyncio


async def run_foo():
    while True:
        await asyncio.sleep(1)
        print("Hello world...")

if __name__ == '__main__':
    loop = asyncio.get_event_loop()
    loop.run_until_complete(run_foo())