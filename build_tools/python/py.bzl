load("@dbx_build_tools//build_tools/py:py.bzl",
    "dbx_py_binary",
    "dbx_py_library",
    "dbx_py_pytest_test",
)

def py_library(**kwargs):
    return dbx_py_library(**kwargs)

def py_binary(**kwargs):
    return dbx_py_binary(**kwargs)

def py_pytest(**kwargs):
    return dbx_py_pytest_test(**kwargs)

