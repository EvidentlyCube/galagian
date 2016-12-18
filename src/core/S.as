package core {
	public function S():S_Impl {
		return S_Impl.instance;
	}
}

import net.retrocade.retrocamel.interfaces.IRetrocamelSettings;

class S_Impl implements IRetrocamelSettings{
	public static var instance:S_Impl = new S_Impl();

	public function get gameWidth():uint {
		return 500;
	}

	public function get gameHeight():uint {
		return 550;
	}
}
