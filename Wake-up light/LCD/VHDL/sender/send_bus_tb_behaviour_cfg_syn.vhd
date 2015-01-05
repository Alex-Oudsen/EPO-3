configuration send_bus_tb_behaviour_cfg_syn of send_bus_tb is
   for behaviour
      for all: send_bus use configuration work.send_bus_synthesised_cfg;
      end for;
   end for;
end send_bus_tb_behaviour_cfg_syn;


