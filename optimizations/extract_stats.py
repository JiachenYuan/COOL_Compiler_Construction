import pathlib
import re
for ff in ["tests_out", "tests_private_out"]:
    print("UnitSCCP")
    print("| filename | removed | unreachable | replaced |")
    print("| --- | --- | --- | --- |")
    for f in pathlib.Path(ff).glob('*.out'):
        sccp_removed = []
        sccp_unreachable = []
        sccp_replaced = []
        for line in f.read_text().splitlines():
            if line.startswith('UnitSCCP: '):
                matches = re.findall(r"(\d+) instructions removed, (\d+) basic blocks unreachable, (\d+) instructions simplified", line.strip())
                if matches:
                    instructions_removed, basic_blocks_unreachable, instructions_simplified = matches[0]
                    sccp_removed.append(str(instructions_removed))
                    sccp_unreachable.append(str(basic_blocks_unreachable))
                    sccp_replaced.append(str(instructions_simplified))
        sccp_removed = [sccp_removed[len(sccp_removed) // 2 - 1], sccp_removed[-1]]
        sccp_unreachable = [sccp_unreachable[len(sccp_unreachable) // 2 - 1], sccp_unreachable[-1]]
        sccp_replaced = [sccp_replaced[len(sccp_replaced) // 2 - 1], sccp_replaced[-1]]
        print(f"| {f.name} | {'/'.join(sccp_removed)} | {'/'.join(sccp_unreachable)} | {'/'.join(sccp_replaced)} |")
    
    print()

for ff in ["tests_out"]:
    print("UnitLICM")
    print("| filename | store | load | computational | total |")
    print("| --- | --- | --- | --- | --- |")
    for f in pathlib.Path(ff).glob('*.out'):
        store = []
        load = []
        computational = []
        total = []
        for line in f.read_text().splitlines():
            if line.startswith('[UnitLICM]: '):
                store_match = re.findall(r"\[UnitLICM\]: NumStoreHoisted: (\d+)", line.strip())
                if store_match:
                    store.append(store_match[0])
                load_match = re.findall(r"\[UnitLICM\]: NumLoadHoisted: (\d+)", line.strip())
                if load_match:
                    load.append(load_match[0])
                compute_match = re.findall(r"\[UnitLICM\]: NumComputeHoisted: (\d+)", line.strip())
                if compute_match:
                    computational.append(compute_match[0])
                total_match = re.findall(r"\[UnitLICM\]: Total: (\d+)", line.strip())
                if total_match:
                    total.append(total_match[0])

        # print(store, load, computational)
        print(f"| {f.name} | {str(sum([int(x) for x in store]))} | {str(sum([int(x) for x in load]))} | {str(sum([int(x) for x in computational]))} | {str(sum([int(x) for x in total]))} |")
