local status, dressing = pcall(require, "dressing")
if not status then
    print('dressing not installed')
return
end
dressing.setup()
