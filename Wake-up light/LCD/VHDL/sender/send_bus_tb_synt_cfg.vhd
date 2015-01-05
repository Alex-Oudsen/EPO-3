configuration send_bus_tb_synt_cfg of send_bus_tb is
   for behaviour
      for all: send_bus use configuration work.send_bus_behaviour_cfg;
      end for;
   end for;
end send_bus_tb_synt_cfg;


