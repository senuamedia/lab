; ModuleID = 'simplex_program'
target triple = "x86_64-apple-macosx14.0.0"

declare ptr @malloc(i64)
declare void @free(ptr)
declare void @intrinsic_println(ptr)
declare void @intrinsic_print(ptr)
declare void @"print_i64"(i64)
declare ptr @intrinsic_int_to_string(i64)
declare ptr @intrinsic_string_new(ptr)
declare ptr @intrinsic_string_from_char(i64)
declare i64 @intrinsic_string_len(ptr)
declare ptr @intrinsic_string_concat(ptr, ptr)
declare ptr @intrinsic_string_slice(ptr, i64, i64)
declare i64 @intrinsic_string_char_at(ptr, i64)
declare i1 @intrinsic_string_eq(ptr, ptr)
declare i64 @intrinsic_string_to_int(ptr)
declare i64 @"String_from"(i64)
declare i64 @"String_len"(i64)
declare ptr @intrinsic_vec_new()
declare void @intrinsic_vec_push(ptr, ptr)
declare ptr @intrinsic_vec_get(ptr, i64)
declare i64 @intrinsic_vec_len(ptr)
declare void @intrinsic_vec_set(ptr, i64, ptr)
declare ptr @intrinsic_vec_pop(ptr)
declare void @intrinsic_vec_clear(ptr)
declare void @intrinsic_vec_remove(ptr, i64)
declare ptr @intrinsic_get_args()
declare ptr @intrinsic_read_file(ptr)
declare void @intrinsic_write_file(ptr, ptr)
declare ptr @store_ptr(ptr, i64, ptr)
declare ptr @store_i64(ptr, i64, i64)
declare ptr @load_ptr(ptr, i64)
declare i64 @load_i64(ptr, i64)
; Timing intrinsics
declare i64 @intrinsic_get_time_ms()
declare i64 @intrinsic_get_time_us()
declare i64 @intrinsic_get_time_ns()
; Float bit conversion intrinsics
declare i64 @"f64_to_bits"(double)
declare i64 @"bits_to_f64"(i64)
; Arena allocator intrinsics
declare ptr @intrinsic_arena_create(i64)
declare ptr @intrinsic_arena_alloc(ptr, i64)
declare void @intrinsic_arena_reset(ptr)
declare void @intrinsic_arena_free(ptr)
declare i64 @intrinsic_arena_used(ptr)
; StringBuilder intrinsics
declare ptr @intrinsic_sb_new()
declare ptr @intrinsic_sb_new_cap(i64)
declare void @intrinsic_sb_append(ptr, ptr)
declare void @intrinsic_sb_append_char(ptr, i64)
declare void @intrinsic_sb_append_i64(ptr, i64)
declare ptr @intrinsic_sb_to_string(ptr)
declare void @intrinsic_sb_clear(ptr)
declare void @intrinsic_sb_free(ptr)
declare i64 @intrinsic_sb_len(ptr)
; File I/O intrinsics
declare ptr @intrinsic_getenv(ptr)
declare i64 @intrinsic_file_exists(ptr)
declare i64 @intrinsic_is_file(ptr)
declare i64 @intrinsic_is_directory(ptr)
declare i64 @intrinsic_file_size(ptr)
declare i64 @intrinsic_file_mtime(ptr)
declare i64 @intrinsic_remove_path(ptr)
declare i64 @intrinsic_mkdir_p(ptr)
declare ptr @intrinsic_get_cwd()
declare i64 @intrinsic_set_cwd(ptr)
declare ptr @intrinsic_list_dir(ptr)
declare ptr @intrinsic_path_join(ptr, ptr)
declare ptr @intrinsic_path_dirname(ptr)
declare ptr @intrinsic_path_basename(ptr)
declare ptr @intrinsic_path_extension(ptr)
declare i64 @file_copy(ptr, ptr)
declare i64 @file_rename(ptr, ptr)
declare void @stderr_write(ptr)
declare void @stderr_writeln(ptr)
; Error handling intrinsics
declare void @intrinsic_panic(ptr)
declare void @intrinsic_print_stack_trace()
; Process intrinsics
declare i64 @intrinsic_process_run(ptr)
declare ptr @intrinsic_process_output(ptr)
; Phase 20: REPL/I/O intrinsics
declare ptr @intrinsic_read_line()
declare i64 @intrinsic_is_tty()
declare i64 @intrinsic_stdin_has_data()
declare i64 @intrinsic_string_hash(ptr)
declare i64 @intrinsic_string_find(ptr, ptr, i64)
declare ptr @intrinsic_string_trim(ptr)
declare ptr @intrinsic_string_split(ptr, ptr)
declare i64 @intrinsic_string_starts_with(ptr, ptr)
declare i64 @intrinsic_string_ends_with(ptr, ptr)
declare i64 @intrinsic_string_contains(ptr, ptr)
declare ptr @intrinsic_string_replace(ptr, ptr, ptr)
declare ptr @intrinsic_string_lines(ptr)
declare ptr @intrinsic_string_join(ptr, ptr)
declare ptr @intrinsic_string_to_lowercase(ptr)
declare ptr @intrinsic_string_to_uppercase(ptr)
declare i64 @intrinsic_string_compare(ptr, ptr)
declare i64 @intrinsic_copy_file(ptr, ptr)
declare ptr @intrinsic_get_home_dir()
declare i64 @cli_getenv(i64)
declare i64 @"env_get"(i64)
declare i64 @file_read(i64)
declare void @file_write(i64, i64)
declare i64 @remove_path(i64)
declare i64 @f64_parse(ptr)
declare i64 @"make_sx_string"(i64)
; SLM native bindings
declare i64 @"slm_native_load"(i64, i64, i64)
declare i64 @"slm_native_unload"(i64)
declare i64 @"slm_native_create_context"(i64, i64)
declare i64 @"slm_native_destroy_context"(i64)
declare i64 @"slm_native_tokenize"(i64, i64)
declare i64 @"slm_native_infer"(i64, i64, i64)
declare i64 @"slm_native_generate"(i64, i64, i64, i64)
declare i64 @"slm_native_embed"(i64, i64)
declare i64 @"slm_native_similarity"(i64, i64)
declare i64 @"slm_native_context_size"(i64)
declare i64 @"slm_native_embedding_size"(i64)
declare i64 @"slm_native_get_model_info"(i64)
; Generator intrinsics
declare i64 @generator_yield(i64)
declare i64 @generator_new(i64)
declare i64 @generator_next(i64)
declare i64 @generator_done(i64)
; Belief guard intrinsics
declare i64 @belief_guard_get_confidence(i64)
declare i64 @belief_guard_get_derivative(i64)
declare i64 @belief_register(i64, double, double)
declare i64 @belief_update(i64, double)
declare i64 @belief_update_dual(i64, double, double)
declare double @belief_get_value(i64)
declare i64 @belief_register_i64(i64, i64, i64)
declare i64 @belief_update_i64(i64, i64)
declare i64 @belief_update_dual_i64(i64, i64, i64)
; Belief suspend/wake intrinsics
declare i64 @belief_suspend_receive(i64, i64, i64, i64, i64, double, i64, i64)
declare i64 @belief_cancel_suspend(i64)
declare i64 @belief_suspended_count()
declare i64 @belief_get_actor_suspends(i64)
declare i64 @belief_clear_actor_suspends(i64)
declare i64 @belief_suspend_get_belief(i64)
declare i64 @belief_suspend_get_actor(i64)
declare i64 @belief_suspend_get_duration_ms(i64)
declare i64 @future_poll(i64)
declare i64 @future_ready(i64)
declare i64 @future_pending()
declare i64 @executor_run(i64)
declare i64 @executor_spawn(i64)
declare i64 @block_on(i64)
declare i64 @async_join(i64, i64)
declare i64 @join_result1(i64)
declare i64 @join_result2(i64)
declare i64 @async_select(i64, i64)
declare i64 @select_result(i64)
declare i64 @select_which(i64)
declare i64 @async_timeout(i64, i64)
declare i64 @timeout_result(i64)
declare i64 @timeout_expired(i64)
declare i64 @time_now_ms()
declare i64 @pin_new(i64, i64)
declare i64 @pin_new_uninit(i64)
declare i64 @pin_get(i64)
declare i64 @pin_get_mut(i64)
declare i64 @pin_is_pinned(i64)
declare void @pin_ref(i64)
declare void @pin_unref(i64)
declare void @pin_set_self_ref(i64, i64)
declare i64 @pin_check_self_ref(i64, i64)
declare i64 @intrinsic_call0(i64)
declare i64 @intrinsic_call1(i64, i64)
declare i64 @intrinsic_call2(i64, i64, i64)
declare i64 @intrinsic_call3(i64, i64, i64, i64)
declare i64 @scope_new()
declare i64 @scope_spawn(i64, i64)
declare i64 @scope_poll(i64)
declare i64 @scope_join(i64)
declare i64 @scope_get_result(i64, i64)
declare void @scope_cancel(i64)
declare i64 @scope_count(i64)
declare i64 @scope_completed(i64)
declare void @scope_free(i64)
declare i64 @nursery_run(i64, i64)
declare i64 @actor_get_status(i64)
declare i64 @actor_get_exit_reason(i64)
declare i64 @actor_get_error_code(i64)
declare void @actor_set_error(i64, i64, i64)
declare void @actor_stop(i64)
declare void @actor_kill(i64)
declare void @actor_crash(i64, i64, i64)
declare void @actor_set_on_error(i64, i64)
declare void @actor_set_on_exit(i64, i64)
declare void @actor_set_supervisor(i64, i64)
declare i64 @actor_get_supervisor(i64)
declare i64 @actor_get_restart_count(i64)
declare void @actor_increment_restart(i64)
declare i64 @actor_is_alive(i64)
declare i64 @circuit_breaker_new(i64, i64, i64)
declare i64 @circuit_breaker_allow(i64)
declare void @circuit_breaker_success(i64)
declare void @circuit_breaker_failure(i64)
declare i64 @circuit_breaker_state(i64)
declare void @circuit_breaker_reset(i64)
declare i64 @retry_policy_new(i64, i64, i64, i64)
declare void @retry_policy_set_jitter(i64, i64)
declare i64 @retry_policy_should_retry(i64)
declare i64 @retry_policy_next_delay(i64)
declare void @retry_policy_reset(i64)
declare i64 @retry_policy_count(i64)
declare i64 @actor_link(i64, i64)
declare void @actor_unlink(i64, i64)
declare i64 @actor_monitor(i64, i64)
declare void @actor_demonitor(i64)
declare void @actor_propagate_exit(i64, i64)
declare i64 @actor_is_linked(i64, i64)
declare i64 @actor_spawn_link(i64, i64, i64)
declare i64 @actor_get_links_count(i64)
declare i64 @actor_send_down(i64, i64, i64)
; Phase 23.1: Supervision Trees
declare i64 @supervisor_new(i64, i64, i64)
declare i64 @supervisor_add_child(i64, i64, i64, i64, i64)
declare i64 @supervisor_start(i64)
declare void @supervisor_stop(i64)
declare i64 @supervisor_handle_exit(i64, i64, i64)
declare i64 @supervisor_child_count(i64)
declare i64 @supervisor_child_status(i64, i64)
declare i64 @supervisor_child_handle(i64, i64)
declare void @supervisor_free(i64)
declare i64 @strategy_one_for_one()
declare i64 @strategy_one_for_all()
declare i64 @strategy_rest_for_one()
declare i64 @child_permanent()
declare i64 @child_temporary()
declare i64 @child_transient()
; Phase 23.2: Work-Stealing Scheduler
declare i64 @scheduler_new(i64)
declare i64 @scheduler_start(i64)
declare i64 @scheduler_submit(i64, i64, i64)
declare i64 @scheduler_submit_local(i64, i64, i64, i64)
declare void @scheduler_stop(i64)
declare void @scheduler_free(i64)
declare i64 @scheduler_worker_count(i64)
declare i64 @scheduler_queue_size(i64)
declare i64 @scheduler_worker_idle(i64, i64)
; Phase 23.3: Lock-Free Mailbox
declare i64 @mailbox_new(i64)
declare i64 @mailbox_send(i64, i64)
declare i64 @mailbox_ask(i64, i64)
declare i64 @mailbox_recv(i64)
declare i64 @mailbox_try_recv(i64)
declare i64 @mailbox_size(i64)
declare i64 @mailbox_empty(i64)
declare i64 @mailbox_full(i64)
declare void @mailbox_close(i64)
declare i64 @mailbox_is_closed(i64)
declare void @mailbox_free(i64)
; Phase 23.6: Actor Discovery and Registry
declare i64 @registry_register(i64, i64)
declare void @registry_unregister(i64)
declare i64 @registry_lookup(i64)
declare i64 @registry_count()
declare i64 @registry_set_metadata(i64, i64)
declare i64 @registry_get_metadata(i64)
; Phase 23.7: Backpressure and Flow Control
declare i64 @flow_controller_new(i64, i64, i64)
declare i64 @flow_check(i64)
declare i64 @flow_acquire(i64)
declare void @flow_release(i64)
declare i64 @flow_is_signaling(i64)
declare i64 @flow_current(i64)
declare i64 @flow_high_watermark(i64)
declare i64 @flow_low_watermark(i64)
declare void @flow_reset(i64)
declare void @flow_free(i64)
declare i64 @flow_mode_drop()
declare i64 @flow_mode_block()
declare i64 @flow_mode_signal()
declare void @intrinsic_exit(i64)
; Phase 1 Stdlib: Option
declare i64 @"option_some"(i64)
declare i64 @"option_none"()
declare i64 @"option_is_some"(i64)
declare i64 @"option_is_none"(i64)
declare i64 @"option_unwrap"(i64)
declare i64 @"option_expect"(i64, i64)
declare i64 @"option_unwrap_or"(i64, i64)
declare i64 @"option_map"(i64, i64)
; Phase 1 Stdlib: Result
declare i64 @"result_ok"(i64)
declare i64 @"result_err"(i64)
declare i64 @"result_is_ok"(i64)
declare i64 @"result_is_err"(i64)
declare i64 @"result_unwrap"(i64)
declare i64 @"result_unwrap_err"(i64)
declare i64 @"result_unwrap_or"(i64, i64)
declare i64 @"result_ok_or"(i64, i64)
; Phase 1 Stdlib: Vec extensions
declare i64 @"vec_sum"(i64)
declare i64 @"vec_find"(i64, i64)
declare i64 @"vec_contains"(i64, i64)
declare i64 @"vec_reverse"(i64)
declare i64 @"vec_clone"(i64)
declare i64 @"vec_first"(i64)
declare i64 @"vec_last"(i64)
declare i64 @"vec_pop"(i64)
declare i64 @"vec_set"(i64, i64, i64)
declare i64 @"vec_clear"(i64)
declare i64 @"vec_remove"(i64, i64)
; Phase 1 Stdlib: HashMap
declare i64 @"hashmap_new"()
declare i64 @"hashmap_insert"(i64, i64, i64)
declare i64 @"hashmap_get"(i64, i64)
declare i64 @"hashmap_remove"(i64, i64)
declare i64 @"hashmap_contains"(i64, i64)
declare i64 @"hashmap_len"(i64)
declare i64 @"hashmap_clear"(i64)
declare i64 @"hashmap_keys"(i64)
declare i64 @"hashmap_values"(i64)
; Phase 1 Stdlib: HashSet
declare i64 @"hashset_new"()
declare i64 @"hashset_insert"(i64, i64)
declare i64 @"hashset_remove"(i64, i64)
declare i64 @"hashset_contains"(i64, i64)
declare i64 @"hashset_len"(i64)
declare i64 @"hashset_clear"(i64)
; Phase 1 Stdlib: JSON
declare i64 @"json_parse_simple"(i64)
declare i64 @"json_stringify"(i64)
declare i64 @"json_get_sx"(i64, i64)
declare i64 @"json_keys"(i64)
declare i64 @"json_is_string"(i64)
declare i64 @"json_is_object"(i64)
declare i64 @"json_is_array"(i64)
declare i64 @"json_as_string"(i64)
declare i64 @"json_as_array"(i64)
declare i64 @"json_object_new"()
declare i64 @"json_array_new"()
declare i64 @"json_object_set"(i64, i64, i64)
declare i64 @"json_array_push"(i64, i64)
declare i64 @"json_string"(i64)
declare i64 @"json_string_sx"(i64)
declare i64 @"json_array_len"(i64)
declare i64 @"json_object_len"(i64)
declare i64 @"json_as_i64"(i64)
declare i64 @"json_get_index"(i64, i64)
declare i64 @"json_is_null"(i64)
declare i64 @"json_object_key_at"(i64, i64)
declare i64 @"json_object_value_at"(i64, i64)
declare i64 @"json_object_set_sx"(i64, i64, i64)
; Phase 3: HTTP Client/Server
declare i64 @"http_request_new"(i64, i64)
declare i64 @"http_request_header"(i64, i64, i64)
declare i64 @"http_request_body"(i64, i64)
declare i64 @"http_request_send"(i64)
declare i64 @"http_request_free"(i64)
declare i64 @"http_response_status"(i64)
declare i64 @"http_response_body"(i64)
declare i64 @"http_response_header"(i64, i64)
declare i64 @"http_response_free"(i64)
declare i64 @"http_server_new"(i64)
declare i64 @"http_server_route"(i64, i64, i64, i64)
declare i64 @"http_server_start"(i64)
declare i64 @"http_server_stop"(i64)
declare i64 @"http_server_free"(i64)
; Phase 3: SQL Database
declare i64 @"sql_open"(i64)
declare void @"sql_close"(i64)
declare i64 @"sql_exec"(i64, i64)
declare i64 @"sql_query"(i64, i64)
declare i64 @"sql_prepare"(i64, i64)
declare i64 @"sql_bind_int"(i64, i64, i64)
declare i64 @"sql_bind_text"(i64, i64, i64)
declare i64 @"sql_bind_float"(i64, i64, double)
declare i64 @"sql_bind_null"(i64, i64)
declare i64 @"sql_bind_blob"(i64, i64, i64, i64)
declare i64 @"sql_step"(i64)
declare i64 @"sql_column_int"(i64, i64)
declare i64 @"sql_column_text"(i64, i64)
declare double @"sql_column_float"(i64, i64)
declare i64 @"sql_column_blob"(i64, i64)
declare i64 @"sql_column_blob_len"(i64, i64)
declare i64 @"sql_column_is_null"(i64, i64)
declare void @"sql_finalize"(i64)
declare i64 @"sql_begin"(i64)
declare i64 @"sql_commit"(i64)
declare i64 @"sql_rollback"(i64)
declare i64 @"sql_last_insert_id"(i64)
; Phase 3: UUID
declare i64 @"uuid_v4"()
declare i64 @"uuid_nil"()
declare i64 @"uuid_is_nil"(i64)
declare i64 @"uuid_is_valid"(i64)
; Phase 3: TOML
declare i64 @"toml_parse"(i64)
declare i64 @"toml_get"(i64, i64)
declare i64 @"toml_get_string"(i64, i64)
declare i64 @"toml_get_int"(i64, i64)
declare double @"toml_get_float"(i64, i64)
declare i64 @"toml_get_bool"(i64, i64)
declare i64 @"toml_get_array"(i64, i64)
declare i64 @"toml_get_table"(i64, i64)
declare i64 @"toml_set_string"(i64, i64, i64)
declare i64 @"toml_set_int"(i64, i64, i64)
declare i64 @"toml_set_float"(i64, i64, double)
declare i64 @"toml_set_bool"(i64, i64, i64)
declare i64 @"toml_stringify"(i64)
declare i64 @"toml_table_new"()
declare i64 @"toml_free"(i64)
; Phase G: AI Features
declare i64 @model_infer(i64)
declare i64 @model_load(i64)
declare i64 @model_embed(i64, i64)
declare i64 @model_classify(i64, i64)
declare void @model_unload(i64)
; AI Vector Operations
declare i64 @vector_new(i64, i64)
declare i64 @vector_len(i64)
declare double @vector_get(i64, i64)
declare void @vector_set(i64, i64, double)
declare double @vector_dot(i64, i64)
declare i64 @vector_add(i64, i64)
declare i64 @vector_sub(i64, i64)
declare i64 @vector_scale(i64, double)
declare double @vector_norm(i64)
declare i64 @vector_normalize(i64)
declare double @vector_cosine_similarity(i64, i64)
; AI Tensor Operations
declare i64 @tensor_new(i64, i64)
declare i64 @tensor_shape(i64)
declare i64 @tensor_rank(i64)
declare double @tensor_get(i64, i64)
declare void @tensor_set(i64, i64, double)
declare i64 @tensor_matmul(i64, i64)
declare i64 @tensor_add(i64, i64)
declare i64 @tensor_transpose(i64)
declare i64 @tensor_reshape(i64, i64)
; Specialist Operations
declare i64 @specialist_query(i64, i64)
declare i64 @specialist_stream(i64, i64)
declare void @specialist_set_context(i64, i64)
declare i64 @specialist_get_context(i64)
; Hive Operations
declare i64 @hive_route(i64, i64)
declare void @hive_add_specialist(i64, i64)
declare void @hive_remove_specialist(i64, i64)
declare i64 @hive_consensus(i64, i64)
declare i64 @"sx_int_to_f64"(i64)
declare i64 @"sx_f64_to_int"(i64)
declare i64 @"sx_f64_add"(i64, i64)
declare i64 @"sx_f64_sub"(i64, i64)
declare i64 @"sx_f64_mul"(i64, i64)
declare i64 @"sx_f64_div"(i64, i64)
declare i64 @"sx_f64_mod"(i64, i64)
declare i64 @"sx_f64_gt"(i64, i64)
declare i64 @"sx_f64_lt"(i64, i64)
declare i64 @"sx_f64_ge"(i64, i64)
declare i64 @"sx_f64_le"(i64, i64)
declare i64 @"sx_f64_eq"(i64, i64)
declare i64 @"sx_f64_ne"(i64, i64)
declare i64 @"f64_neg"(i64)
declare i64 @"json_parse"(i64)
declare i64 @"json_get"(i64, i64)
declare i64 @"json_set"(i64, i64, i64)
declare i64 @"string_from"(i64)
declare i64 @"infer"(i64, i64)
declare i64 @"path_exists"(i64)
declare i64 @"tanh_f64"(i64)
declare i64 @"contract_result_violation_type"(i64)
declare i64 @"activation_record"(i64, i64)
declare i64 @"neural_reset_pruning"()
declare i64 @"device_type"(i64)
declare i64 @"lazy_branch_count"(i64)
declare i64 @"lazy_context_new"()
declare i64 @"lazy_context_free"(i64)
declare i64 @"lazy_dominant_branch"(i64)
declare i64 @"lazy_executed_count"(i64)
declare i64 @"lazy_mark_executed"(i64, i64)
declare i64 @"lazy_should_execute"(i64, i64)
declare i64 @"activation_tracker_init"()
declare i64 @"activation_tracking_enabled"()
declare i64 @"neural_gate_new"(i64, i64, i64, i64)
declare i64 @"neural_gate_with_contract"(i64, i64, i64, i64, i64)
declare i64 @"neural_gate_execute_on_device"(i64, i64, i64)
declare i64 @"gate_bind_device"(i64, i64)
declare i64 @"gate_get_device"(i64)
declare i64 @"gate_has_explicit_binding"(i64)
declare i64 @"dead_path_analyzer_new"()
declare i64 @"dead_path_analyzer_free"(i64)
declare i64 @"dead_path_add_edge"(i64, i64, i64)
declare i64 @"dead_path_mark_entry"(i64, i64)
declare i64 @"dead_path_propagate"(i64)
declare i64 @"dead_path_reachable_count"(i64)
declare i64 @"graph_new"()
declare i64 @"graph_free"(i64)
declare i64 @"graph_add_node"(i64, i64)
declare i64 @"graph_add_edge"(i64, i64, i64)
declare i64 @"graph_partition"(i64, i64)
declare i64 @"graph_partition_count"(i64)
declare i64 @"graph_partition_device"(i64, i64)
declare i64 @"pruning_context_new"()
declare i64 @"pruning_context_free"(i64)
declare i64 @"pruning_add_gate"(i64, i64, i64)
declare i64 @"pruning_execute"(i64)
declare i64 @"pruning_is_pruned"(i64, i64)
declare i64 @"pruning_ratio"(i64)
declare i64 @"pruning_reason"(i64, i64)
declare i64 @"pruning_total_count"(i64)
declare i64 @"structured_pruner_new"()
declare i64 @"structured_pruner_free"(i64)
declare i64 @"speculative_context_new"()
declare i64 @"speculative_context_free"(i64)
declare i64 @"speculative_add_branch"(i64, i64, i64)
declare i64 @"speculative_get_result"(i64, i64)
declare i64 @"speculative_set_result"(i64, i64, i64)
declare i64 @"speculative_weighted_result"(i64)
declare i64 @"speculative_memory_used"(i64)
declare i64 @"speculative_gc"(i64)
declare i64 @"optimization_stats_calculate"(i64, i64)
declare i64 @"optimization_stats_free"(i64)
declare i64 @"optimization_speedup"(i64)
declare i64 @"optimization_size_reduction"(i64)
declare i64 @"dual_variable"(i64)
declare i64 @"dual_constant"(i64)
declare i64 @"dual_add"(i64, i64)
declare i64 @"dual_mul"(i64, i64)
declare i64 @"dual_div"(i64, i64)
declare i64 @"dual_mul_scalar"(i64, i64)
declare i64 @"dual_sin"(i64)
declare i64 @"dual_cos"(i64)
declare i64 @"dual_exp"(i64)
declare i64 @"dual_ln"(i64)
declare i64 @"dual_sqrt"(i64)
declare i64 @"dual_tanh"(i64)
declare i64 @"dual_sigmoid"(i64)
declare i64 @"dual_powi"(i64, i64)
declare i64 @"int_hashset_new"()
declare i64 @"int_hashset_insert"(i64, i64)
declare i64 @"int_hashset_contains"(i64, i64)
declare i64 @"int_hashset_len"(i64)
declare i64 @"not_approx_eq"(i64, i64, i64)
declare i64 @"transfer_queue_init"(i64)
declare i64 @"sxiter_from_vec"(i64)
declare i64 @"sxiter_collect_vec"(i64)
declare i64 @"sxiter_filter"(i64, i64)
declare i64 @"wref_registry_init"()
declare i64 @"wref_new"(i64, i64, i64)
declare i64 @"wref_ptr"(i64)
declare i64 @"wref_weight"(i64)
declare i64 @"wref_count"()
declare i64 @"wref_state"(i64)
declare i64 @"wref_retain"(i64)
declare i64 @"wref_release"(i64)
declare i64 @"wref_is_allocated"(i64)
declare i64 @"wref_collapse"(i64)
declare i64 @"wref_set_weight"(i64, i64)
declare i64 @"wref_set_mode"(i64)
declare i64 @"wref_get_mode"()
declare i64 @"wref_set_weight_threshold"(i64)
declare i64 @"wref_get_weight_threshold"()
declare i64 @"wref_gc"()
declare i64 @"wref_gc_total_runs"()
declare i64 @"wref_gc_total_collected"()
declare i64 @"wref_gc_last_collected"()
declare i64 @"wref_bytes_allocated"()
declare i64 @"device_registry_init"()
declare i64 @"contract_violation_count"()
declare i64 @"contract_set_violation_handler"(i64)
declare i64 @"neural_gate_weight"(i64)
declare i64 @"lazy_eval"(i64)
declare i64 @"lazy_best_branch"(i64)
declare i64 @"print_f64"(i64)
declare i64 @"device_register"(i64, i64, i64, i64, i64, i64)
declare i64 @"lazy_add_branch"(i64, i64)
declare i64 @"contract_result_satisfied"(i64)
declare i64 @"neural_set_temperature"(i64)
declare i64 @"activation_rate_get"(i64)
declare i64 @"neural_register_gate_weight"(i64, i64, i64)
declare i64 @"ckpt_context_fork"(i64)
declare i64 @"ckpt_context_merge"(i64, i64)
declare i64 @"sqrt_f64"(i64)
declare i64 @"ckpt_save"(i64)
declare i64 @"contract_result_ok"()
declare i64 @"neural_get_temperature"()
declare i64 @"activation_mean_get"(i64)
declare i64 @"neural_prune_by_weight_magnitude"(i64)
declare i64 @"activation_gate_count"()
declare i64 @"ckpt_restore"(i64)
declare i64 @"contract_result_new"(i64, i64)
declare i64 @"contract_result_free"(i64)
declare i64 @"device_get_default"()
declare i64 @"grad_tape_temperature"(i64)
declare i64 @"json_object_has"(i64, i64)
declare i64 @"neural_is_gate_pruned"(i64)
declare i64 @"ln_f64"(i64)
declare i64 @"device_get"(i64)
declare i64 @"ckpt_count"()
declare i64 @"contract_in_range"(i64, i64, i64)
declare i64 @"grad_tape_set_training"(i64, i64)
declare i64 @"activation_epoch_current"()
declare i64 @"neural_get_pruned_gate_count"()
declare i64 @"exp_f64"(i64)
declare i64 @"sin_f64"(i64)
declare i64 @"json_is_number"(i64)
declare i64 @"string_to_lowercase"(i64)
declare i64 @"string_split_whitespace"(i64)
declare i64 @"device_count"()
declare i64 @"ckpt_context_new"()
declare i64 @"ckpt_context_free"(i64)
declare i64 @"ckpt_context_save"(i64)
declare i64 @"ckpt_context_restore"(i64)
declare i64 @"contract_get_panic_mode"()
declare i64 @"contract_set_panic_mode"(i64)
declare i64 @"grad_tape_set_temperature"(i64, i64)
declare i64 @"activation_epoch_advance"(i64)
declare i64 @"neural_get_gate_count"()
declare i64 @"json_is_bool"(i64)
; v0.13.0 Runtime
declare i64 @"print_string"(i64)
declare i64 @"file_delete"(i64)
declare i64 @"cos_f64"(i64)
declare i64 @"pow_f64"(i64, i64)
declare i64 @"neural_set_training_mode"(i64)
declare i64 @"neural_get_training_mode"()
declare i64 @"neural_sigmoid"(i64)
declare i64 @"neural_register_gate"(i64)
declare i64 @"neural_clear_gate_registry"()
declare i64 @"neural_gate_count"()
declare i64 @"grad_tape_new"()
declare i64 @"grad_tape_free"(i64)
declare i64 @"grad_tape_len"(i64)
declare i64 @"grad_tape_record"(i64, i64)
declare i64 @"contract_check_requires"(i64, i64, i64)
declare i64 @"contract_check_ensures"(i64, i64, i64)
declare i64 @"contract_check_invariant"(i64, i64, i64)
declare i64 @"device_available"(i64)
declare i64 @"activation_count_inc"(i64)
declare i64 @"activation_count_get"(i64)
declare i64 @"ckpt_branch_start"()
declare i64 @"ckpt_branch_end"(i64)
declare i64 @"anneal_exponential"(i64, i64)
declare i64 @"anneal_linear"(i64, i64)
declare i64 @"json_null"()
declare i64 @"json_bool"(i64)
declare i64 @"json_number_i64"(i64)
declare i64 @"json_number_f64"(i64)
declare i64 @"json_array"()
declare i64 @"json_object"()
declare i64 @"json_as_bool"(i64)
declare i64 @"HashMap_new"()
declare i64 @"hashmap_is_empty"(i64)
declare i64 @"timer_start"()
declare i64 @"timer_elapsed_us"(i64)
declare i64 @"timer_elapsed_ms"(i64)
declare i64 @"timer_elapsed_s"(i64)
declare i64 @"timer_close"(i64)
declare i64 @"timer_record_to"(i64, i64)
declare i64 @"logger_new"()
declare i64 @"logger_global"()
declare i64 @"logger_set_level"(i64, i64)
declare i64 @"logger_set_console"(i64, i64)
declare i64 @"logger_set_file"(i64, i64)
declare i64 @"logger_set_json"(i64, i64)
declare i64 @"logger_add_context"(i64, i64, i64)
declare i64 @"logger_close"(i64)
declare i64 @"log_debug"(i64)
declare i64 @"log_info"(i64)
declare i64 @"log_warn"(i64)
declare i64 @"log_error"(i64)
declare i64 @"log_fatal"(i64)
declare i64 @"log_with_field"(i64, i64, i64)
declare i64 @"log_with_span"(i64, i64)
declare i64 @"counter_new"(i64)
declare i64 @"counter_inc"(i64)
declare i64 @"counter_add"(i64, i64)
declare i64 @"counter_add_label"(i64, i64, i64)
declare i64 @"counter_value"(i64)
declare i64 @"gauge_new"(i64)
declare i64 @"gauge_set"(i64, i64)
declare i64 @"gauge_inc"(i64)
declare i64 @"gauge_dec"(i64)
declare i64 @"gauge_add"(i64, i64)
declare i64 @"gauge_value"(i64)
declare i64 @"histogram_new"(i64)
declare i64 @"histogram_observe"(i64, i64)
declare i64 @"histogram_count"(i64)
declare i64 @"histogram_sum"(i64)
declare i64 @"histogram_mean"(i64)
declare i64 @"histogram_min"(i64)
declare i64 @"histogram_max"(i64)
declare i64 @"histogram_to_json"(i64)
declare i64 @"metrics_registry_new"()
declare i64 @"metrics_registry_global"()
declare i64 @"metrics_registry_count"(i64)
declare i64 @"metrics_registry_close"(i64)
declare i64 @"metrics_export_json"(i64)
declare i64 @"metrics_export_prometheus"(i64)
declare i64 @"span_start"(i64)
declare i64 @"span_start_child"(i64, i64)
declare i64 @"span_end"(i64)
declare i64 @"span_close"(i64)
declare i64 @"span_id"(i64)
declare i64 @"span_trace_id"(i64)
declare i64 @"span_duration_us"(i64)
declare i64 @"span_set_attribute"(i64, i64, i64)
declare i64 @"span_set_status"(i64, i64)
declare i64 @"span_add_event"(i64, i64)
declare i64 @"span_to_json"(i64)
declare i64 @"tracer_new"()
declare i64 @"tracer_active_spans"(i64)
declare i64 @"tracer_close"(i64)

define i64 @"abs_f64"(i64 %x) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t0 = load i64, ptr %local.x
  %t1 = call i64 @f64_parse(ptr @.str.exp_ns_2d.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_ns_2d.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"diff_a"(i64 %a, i64 %nu) nounwind {
entry:
  %local.a = alloca i64
  store i64 %a, ptr %local.a
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %t9 = call i64 @f64_parse(ptr @.str.exp_ns_2d.2)
  %t10 = load i64, ptr %local.nu
  %t11 = call i64 @f64_parse(ptr @.str.exp_ns_2d.3)
  %t12 = call i64 @"sx_f64_mul"(i64 %t10, i64 %t11)
  %t13 = load i64, ptr %local.a
  %t14 = call i64 @"sx_f64_mul"(i64 %t12, i64 %t13)
  %t15 = call i64 @"sx_f64_sub"(i64 %t9, i64 %t14)
  ret i64 %t15
}

define i64 @"diff_b"(i64 %b, i64 %nu) nounwind {
entry:
  %local.b = alloca i64
  store i64 %b, ptr %local.b
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %t16 = call i64 @f64_parse(ptr @.str.exp_ns_2d.4)
  %t17 = load i64, ptr %local.nu
  %t18 = call i64 @f64_parse(ptr @.str.exp_ns_2d.5)
  %t19 = call i64 @"sx_f64_mul"(i64 %t17, i64 %t18)
  %t20 = load i64, ptr %local.b
  %t21 = call i64 @"sx_f64_mul"(i64 %t19, i64 %t20)
  %t22 = call i64 @"sx_f64_sub"(i64 %t16, i64 %t21)
  ret i64 %t22
}

define i64 @"diff_c"(i64 %c, i64 %nu) nounwind {
entry:
  %local.c = alloca i64
  store i64 %c, ptr %local.c
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %t23 = call i64 @f64_parse(ptr @.str.exp_ns_2d.6)
  %t24 = load i64, ptr %local.nu
  %t25 = call i64 @f64_parse(ptr @.str.exp_ns_2d.7)
  %t26 = call i64 @"sx_f64_mul"(i64 %t24, i64 %t25)
  %t27 = load i64, ptr %local.c
  %t28 = call i64 @"sx_f64_mul"(i64 %t26, i64 %t27)
  %t29 = call i64 @"sx_f64_sub"(i64 %t23, i64 %t28)
  ret i64 %t29
}

define i64 @"diff_d"(i64 %d, i64 %nu) nounwind {
entry:
  %local.d = alloca i64
  store i64 %d, ptr %local.d
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %t30 = call i64 @f64_parse(ptr @.str.exp_ns_2d.8)
  %t31 = load i64, ptr %local.nu
  %t32 = call i64 @f64_parse(ptr @.str.exp_ns_2d.9)
  %t33 = call i64 @"sx_f64_mul"(i64 %t31, i64 %t32)
  %t34 = load i64, ptr %local.d
  %t35 = call i64 @"sx_f64_mul"(i64 %t33, i64 %t34)
  %t36 = call i64 @"sx_f64_sub"(i64 %t30, i64 %t35)
  ret i64 %t36
}

define i64 @"nl_a"(i64 %b, i64 %c, i64 %d) nounwind {
entry:
  %local.b = alloca i64
  store i64 %b, ptr %local.b
  %local.c = alloca i64
  store i64 %c, ptr %local.c
  %local.d = alloca i64
  store i64 %d, ptr %local.d
  %t37 = call i64 @f64_parse(ptr @.str.exp_ns_2d.10)
  %t38 = load i64, ptr %local.b
  %t39 = load i64, ptr %local.c
  %t40 = call i64 @"sx_f64_mul"(i64 %t38, i64 %t39)
  %t41 = load i64, ptr %local.b
  %t42 = load i64, ptr %local.d
  %t43 = call i64 @"sx_f64_mul"(i64 %t41, i64 %t42)
  %t44 = call i64 @"sx_f64_sub"(i64 %t40, i64 %t43)
  %t45 = call i64 @"sx_f64_mul"(i64 %t37, i64 %t44)
  ret i64 %t45
}

define i64 @"nl_b"(i64 %a, i64 %c, i64 %d) nounwind {
entry:
  %local.a = alloca i64
  store i64 %a, ptr %local.a
  %local.c = alloca i64
  store i64 %c, ptr %local.c
  %local.d = alloca i64
  store i64 %d, ptr %local.d
  %t46 = call i64 @f64_parse(ptr @.str.exp_ns_2d.11)
  %t47 = load i64, ptr %local.a
  %t48 = load i64, ptr %local.d
  %t49 = call i64 @"sx_f64_mul"(i64 %t47, i64 %t48)
  %t50 = load i64, ptr %local.a
  %t51 = load i64, ptr %local.c
  %t52 = call i64 @"sx_f64_mul"(i64 %t50, i64 %t51)
  %t53 = call i64 @"sx_f64_sub"(i64 %t49, i64 %t52)
  %t54 = call i64 @"sx_f64_mul"(i64 %t46, i64 %t53)
  ret i64 %t54
}

define i64 @"nl_c"(i64 %a, i64 %b) nounwind {
entry:
  %local.a = alloca i64
  store i64 %a, ptr %local.a
  %local.b = alloca i64
  store i64 %b, ptr %local.b
  %t55 = call i64 @f64_parse(ptr @.str.exp_ns_2d.12)
  %t56 = load i64, ptr %local.a
  %t57 = call i64 @"sx_f64_mul"(i64 %t55, i64 %t56)
  %t58 = load i64, ptr %local.b
  %t59 = call i64 @"sx_f64_mul"(i64 %t57, i64 %t58)
  ret i64 %t59
}

define i64 @"nl_d"(i64 %a, i64 %b) nounwind {
entry:
  %local.a = alloca i64
  store i64 %a, ptr %local.a
  %local.b = alloca i64
  store i64 %b, ptr %local.b
  %t60 = call i64 @f64_parse(ptr @.str.exp_ns_2d.13)
  %t61 = call i64 @f64_parse(ptr @.str.exp_ns_2d.14)
  %t62 = load i64, ptr %local.a
  %t63 = call i64 @"sx_f64_mul"(i64 %t61, i64 %t62)
  %t64 = load i64, ptr %local.b
  %t65 = call i64 @"sx_f64_mul"(i64 %t63, i64 %t64)
  %t66 = call i64 @"sx_f64_sub"(i64 %t60, i64 %t65)
  ret i64 %t66
}

define i64 @"iratio_4vec"(i64 %da_v, i64 %db_v, i64 %dc_v, i64 %dd_v, i64 %na_v, i64 %nb_v, i64 %nc_v, i64 %nd_v) nounwind {
entry:
  %local.cross.67 = alloca i64
  %local.ind.68 = alloca i64
  %local.da_v = alloca i64
  store i64 %da_v, ptr %local.da_v
  %local.db_v = alloca i64
  store i64 %db_v, ptr %local.db_v
  %local.dc_v = alloca i64
  store i64 %dc_v, ptr %local.dc_v
  %local.dd_v = alloca i64
  store i64 %dd_v, ptr %local.dd_v
  %local.na_v = alloca i64
  store i64 %na_v, ptr %local.na_v
  %local.nb_v = alloca i64
  store i64 %nb_v, ptr %local.nb_v
  %local.nc_v = alloca i64
  store i64 %nc_v, ptr %local.nc_v
  %local.nd_v = alloca i64
  store i64 %nd_v, ptr %local.nd_v
  %t69 = load i64, ptr %local.da_v
  %t70 = load i64, ptr %local.na_v
  %t71 = call i64 @"sx_f64_mul"(i64 %t69, i64 %t70)
  %t72 = load i64, ptr %local.db_v
  %t73 = load i64, ptr %local.nb_v
  %t74 = call i64 @"sx_f64_mul"(i64 %t72, i64 %t73)
  %t75 = call i64 @"sx_f64_add"(i64 %t71, i64 %t74)
  %t76 = load i64, ptr %local.dc_v
  %t77 = load i64, ptr %local.nc_v
  %t78 = call i64 @"sx_f64_mul"(i64 %t76, i64 %t77)
  %t79 = call i64 @"sx_f64_add"(i64 %t75, i64 %t78)
  %t80 = load i64, ptr %local.dd_v
  %t81 = load i64, ptr %local.nd_v
  %t82 = call i64 @"sx_f64_mul"(i64 %t80, i64 %t81)
  %t83 = call i64 @"sx_f64_add"(i64 %t79, i64 %t82)
  store i64 %t83, ptr %local.cross.67
  %t84 = load i64, ptr %local.da_v
  %t85 = load i64, ptr %local.da_v
  %t86 = call i64 @"sx_f64_mul"(i64 %t84, i64 %t85)
  %t87 = load i64, ptr %local.db_v
  %t88 = load i64, ptr %local.db_v
  %t89 = call i64 @"sx_f64_mul"(i64 %t87, i64 %t88)
  %t90 = call i64 @"sx_f64_add"(i64 %t86, i64 %t89)
  %t91 = load i64, ptr %local.dc_v
  %t92 = load i64, ptr %local.dc_v
  %t93 = call i64 @"sx_f64_mul"(i64 %t91, i64 %t92)
  %t94 = call i64 @"sx_f64_add"(i64 %t90, i64 %t93)
  %t95 = load i64, ptr %local.dd_v
  %t96 = load i64, ptr %local.dd_v
  %t97 = call i64 @"sx_f64_mul"(i64 %t95, i64 %t96)
  %t98 = call i64 @"sx_f64_add"(i64 %t94, i64 %t97)
  store i64 %t98, ptr %local.ind.68
  %t99 = load i64, ptr %local.ind.68
  %t100 = load i64, ptr %local.na_v
  %t101 = load i64, ptr %local.na_v
  %t102 = call i64 @"sx_f64_mul"(i64 %t100, i64 %t101)
  %t103 = call i64 @"sx_f64_add"(i64 %t99, i64 %t102)
  %t104 = load i64, ptr %local.nb_v
  %t105 = load i64, ptr %local.nb_v
  %t106 = call i64 @"sx_f64_mul"(i64 %t104, i64 %t105)
  %t107 = call i64 @"sx_f64_add"(i64 %t103, i64 %t106)
  %t108 = load i64, ptr %local.nc_v
  %t109 = load i64, ptr %local.nc_v
  %t110 = call i64 @"sx_f64_mul"(i64 %t108, i64 %t109)
  %t111 = call i64 @"sx_f64_add"(i64 %t107, i64 %t110)
  %t112 = load i64, ptr %local.nd_v
  %t113 = load i64, ptr %local.nd_v
  %t114 = call i64 @"sx_f64_mul"(i64 %t112, i64 %t113)
  %t115 = call i64 @"sx_f64_add"(i64 %t111, i64 %t114)
  store i64 %t115, ptr %local.ind.68
  %t116 = load i64, ptr %local.ind.68
  %t117 = call i64 @f64_parse(ptr @.str.exp_ns_2d.15)
  %t118 = call i64 @"sx_f64_lt"(i64 %t116, i64 %t117)
  %t119 = icmp ne i64 %t118, 0
  br i1 %t119, label %then1, label %else1
then1:
  %t120 = call i64 @f64_parse(ptr @.str.exp_ns_2d.16)
  ret i64 %t120
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t121 = phi i64 [ 0, %else1_end ]
  %t122 = load i64, ptr %local.cross.67
  %t123 = load i64, ptr %local.ind.68
  %t124 = call i64 @"sx_f64_div"(i64 %t122, i64 %t123)
  ret i64 %t124
}

define i64 @"s_score"(i64 %early, i64 %late) nounwind {
entry:
  %local.early = alloca i64
  store i64 %early, ptr %local.early
  %local.late = alloca i64
  store i64 %late, ptr %local.late
  %t125 = load i64, ptr %local.early
  %t126 = call i64 @f64_parse(ptr @.str.exp_ns_2d.17)
  %t127 = call i64 @"sx_f64_lt"(i64 %t125, i64 %t126)
  %t128 = icmp ne i64 %t127, 0
  br i1 %t128, label %then2, label %else2
then2:
  %t129 = load i64, ptr %local.late
  %t130 = call i64 @f64_parse(ptr @.str.exp_ns_2d.18)
  %t131 = call i64 @"sx_f64_lt"(i64 %t129, i64 %t130)
  %t132 = icmp ne i64 %t131, 0
  br i1 %t132, label %then3, label %else3
then3:
  %t133 = call i64 @f64_parse(ptr @.str.exp_ns_2d.19)
  ret i64 %t133
else3:
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t134 = phi i64 [ 0, %else3_end ]
  %t135 = call i64 @f64_parse(ptr @.str.exp_ns_2d.20)
  %t136 = call i64 @f64_parse(ptr @.str.exp_ns_2d.21)
  %t137 = call i64 @"sx_f64_sub"(i64 %t135, i64 %t136)
  ret i64 %t137
else2:
  br label %else2_end
else2_end:
  br label %endif2
endif2:
  %t138 = phi i64 [ 0, %else2_end ]
  %t139 = call i64 @f64_parse(ptr @.str.exp_ns_2d.22)
  %t140 = load i64, ptr %local.late
  %t141 = load i64, ptr %local.early
  %t142 = call i64 @"sx_f64_div"(i64 %t140, i64 %t141)
  %t143 = call i64 @"sx_f64_sub"(i64 %t139, i64 %t142)
  ret i64 %t143
}

define i64 @"energy"(i64 %a, i64 %b, i64 %c, i64 %d) nounwind {
entry:
  %local.a = alloca i64
  store i64 %a, ptr %local.a
  %local.b = alloca i64
  store i64 %b, ptr %local.b
  %local.c = alloca i64
  store i64 %c, ptr %local.c
  %local.d = alloca i64
  store i64 %d, ptr %local.d
  %t144 = load i64, ptr %local.a
  %t145 = load i64, ptr %local.a
  %t146 = call i64 @"sx_f64_mul"(i64 %t144, i64 %t145)
  %t147 = load i64, ptr %local.b
  %t148 = load i64, ptr %local.b
  %t149 = call i64 @"sx_f64_mul"(i64 %t147, i64 %t148)
  %t150 = call i64 @"sx_f64_add"(i64 %t146, i64 %t149)
  %t151 = load i64, ptr %local.c
  %t152 = load i64, ptr %local.c
  %t153 = call i64 @"sx_f64_mul"(i64 %t151, i64 %t152)
  %t154 = call i64 @"sx_f64_add"(i64 %t150, i64 %t153)
  %t155 = load i64, ptr %local.d
  %t156 = load i64, ptr %local.d
  %t157 = call i64 @"sx_f64_mul"(i64 %t155, i64 %t156)
  %t158 = call i64 @"sx_f64_add"(i64 %t154, i64 %t157)
  ret i64 %t158
}

define i64 @"run_2d_sim"(i64 %nu, i64 %out_mode) nounwind {
entry:
  %local.dt.159 = alloca i64
  %local.nsteps.160 = alloca i64
  %local.a.161 = alloca i64
  %local.b.162 = alloca i64
  %local.c.163 = alloca i64
  %local.d.164 = alloca i64
  %local.step.165 = alloca i64
  %local.prev_e.166 = alloca i64
  %local.early_drift.167 = alloca i64
  %local.late_drift.168 = alloca i64
  %local.count_e.169 = alloca i64
  %local.count_l.170 = alloca i64
  %local.sum_ir.171 = alloca i64
  %local.count_ir.172 = alloca i64
  %local.f_da.173 = alloca i64
  %local.f_db.174 = alloca i64
  %local.f_dc.175 = alloca i64
  %local.f_dd.176 = alloca i64
  %local.f_na.177 = alloca i64
  %local.f_nb.178 = alloca i64
  %local.f_nc.179 = alloca i64
  %local.f_nd.180 = alloca i64
  %local.e_now.181 = alloca i64
  %local.drift.182 = alloca i64
  %local.ir.183 = alloca i64
  %local.avg_ir.184 = alloca i64
  %local.ss.185 = alloca i64
  %local.e_final.186 = alloca i64
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.out_mode = alloca i64
  store i64 %out_mode, ptr %local.out_mode
  %t187 = call i64 @f64_parse(ptr @.str.exp_ns_2d.23)
  store i64 %t187, ptr %local.dt.159
  store i64 2000, ptr %local.nsteps.160
  %t188 = call i64 @f64_parse(ptr @.str.exp_ns_2d.24)
  store i64 %t188, ptr %local.a.161
  %t189 = call i64 @f64_parse(ptr @.str.exp_ns_2d.25)
  store i64 %t189, ptr %local.b.162
  %t190 = call i64 @f64_parse(ptr @.str.exp_ns_2d.26)
  store i64 %t190, ptr %local.c.163
  %t191 = call i64 @f64_parse(ptr @.str.exp_ns_2d.27)
  store i64 %t191, ptr %local.d.164
  store i64 0, ptr %local.step.165
  %t192 = load i64, ptr %local.a.161
  %t193 = load i64, ptr %local.b.162
  %t194 = load i64, ptr %local.c.163
  %t195 = load i64, ptr %local.d.164
  %t196 = call i64 @"energy"(i64 %t192, i64 %t193, i64 %t194, i64 %t195)
  store i64 %t196, ptr %local.prev_e.166
  %t197 = call i64 @f64_parse(ptr @.str.exp_ns_2d.28)
  store i64 %t197, ptr %local.early_drift.167
  %t198 = call i64 @f64_parse(ptr @.str.exp_ns_2d.29)
  store i64 %t198, ptr %local.late_drift.168
  store i64 0, ptr %local.count_e.169
  store i64 0, ptr %local.count_l.170
  %t199 = call i64 @f64_parse(ptr @.str.exp_ns_2d.30)
  store i64 %t199, ptr %local.sum_ir.171
  store i64 0, ptr %local.count_ir.172
  br label %loop4
loop4:
  %t200 = load i64, ptr %local.step.165
  %t201 = load i64, ptr %local.nsteps.160
  %t202 = icmp slt i64 %t200, %t201
  %t203 = zext i1 %t202 to i64
  %t204 = icmp ne i64 %t203, 0
  br i1 %t204, label %body4, label %endloop4
body4:
  %t205 = load i64, ptr %local.a.161
  %t206 = load i64, ptr %local.nu
  %t207 = call i64 @"diff_a"(i64 %t205, i64 %t206)
  store i64 %t207, ptr %local.f_da.173
  %t208 = load i64, ptr %local.b.162
  %t209 = load i64, ptr %local.nu
  %t210 = call i64 @"diff_b"(i64 %t208, i64 %t209)
  store i64 %t210, ptr %local.f_db.174
  %t211 = load i64, ptr %local.c.163
  %t212 = load i64, ptr %local.nu
  %t213 = call i64 @"diff_c"(i64 %t211, i64 %t212)
  store i64 %t213, ptr %local.f_dc.175
  %t214 = load i64, ptr %local.d.164
  %t215 = load i64, ptr %local.nu
  %t216 = call i64 @"diff_d"(i64 %t214, i64 %t215)
  store i64 %t216, ptr %local.f_dd.176
  %t217 = load i64, ptr %local.b.162
  %t218 = load i64, ptr %local.c.163
  %t219 = load i64, ptr %local.d.164
  %t220 = call i64 @"nl_a"(i64 %t217, i64 %t218, i64 %t219)
  store i64 %t220, ptr %local.f_na.177
  %t221 = load i64, ptr %local.a.161
  %t222 = load i64, ptr %local.c.163
  %t223 = load i64, ptr %local.d.164
  %t224 = call i64 @"nl_b"(i64 %t221, i64 %t222, i64 %t223)
  store i64 %t224, ptr %local.f_nb.178
  %t225 = load i64, ptr %local.a.161
  %t226 = load i64, ptr %local.b.162
  %t227 = call i64 @"nl_c"(i64 %t225, i64 %t226)
  store i64 %t227, ptr %local.f_nc.179
  %t228 = load i64, ptr %local.a.161
  %t229 = load i64, ptr %local.b.162
  %t230 = call i64 @"nl_d"(i64 %t228, i64 %t229)
  store i64 %t230, ptr %local.f_nd.180
  %t231 = load i64, ptr %local.a.161
  %t232 = load i64, ptr %local.dt.159
  %t233 = load i64, ptr %local.f_da.173
  %t234 = load i64, ptr %local.f_na.177
  %t235 = call i64 @"sx_f64_add"(i64 %t233, i64 %t234)
  %t236 = call i64 @"sx_f64_mul"(i64 %t232, i64 %t235)
  %t237 = call i64 @"sx_f64_add"(i64 %t231, i64 %t236)
  store i64 %t237, ptr %local.a.161
  %t238 = load i64, ptr %local.b.162
  %t239 = load i64, ptr %local.dt.159
  %t240 = load i64, ptr %local.f_db.174
  %t241 = load i64, ptr %local.f_nb.178
  %t242 = call i64 @"sx_f64_add"(i64 %t240, i64 %t241)
  %t243 = call i64 @"sx_f64_mul"(i64 %t239, i64 %t242)
  %t244 = call i64 @"sx_f64_add"(i64 %t238, i64 %t243)
  store i64 %t244, ptr %local.b.162
  %t245 = load i64, ptr %local.c.163
  %t246 = load i64, ptr %local.dt.159
  %t247 = load i64, ptr %local.f_dc.175
  %t248 = load i64, ptr %local.f_nc.179
  %t249 = call i64 @"sx_f64_add"(i64 %t247, i64 %t248)
  %t250 = call i64 @"sx_f64_mul"(i64 %t246, i64 %t249)
  %t251 = call i64 @"sx_f64_add"(i64 %t245, i64 %t250)
  store i64 %t251, ptr %local.c.163
  %t252 = load i64, ptr %local.d.164
  %t253 = load i64, ptr %local.dt.159
  %t254 = load i64, ptr %local.f_dd.176
  %t255 = load i64, ptr %local.f_nd.180
  %t256 = call i64 @"sx_f64_add"(i64 %t254, i64 %t255)
  %t257 = call i64 @"sx_f64_mul"(i64 %t253, i64 %t256)
  %t258 = call i64 @"sx_f64_add"(i64 %t252, i64 %t257)
  store i64 %t258, ptr %local.d.164
  %t259 = load i64, ptr %local.a.161
  %t260 = call i64 @f64_parse(ptr @.str.exp_ns_2d.31)
  %t261 = call i64 @"sx_f64_gt"(i64 %t259, i64 %t260)
  %t262 = icmp ne i64 %t261, 0
  br i1 %t262, label %then5, label %else5
then5:
  %t263 = call i64 @f64_parse(ptr @.str.exp_ns_2d.32)
  store i64 %t263, ptr %local.a.161
  br label %then5_end
then5_end:
  br label %endif5
else5:
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t264 = phi i64 [ 0, %then5_end ], [ 0, %else5_end ]
  %t265 = load i64, ptr %local.a.161
  %t266 = call i64 @f64_parse(ptr @.str.exp_ns_2d.33)
  %t267 = xor i64 %t266, -9223372036854775808
  %t268 = call i64 @"sx_f64_lt"(i64 %t265, i64 %t267)
  %t269 = icmp ne i64 %t268, 0
  br i1 %t269, label %then6, label %else6
then6:
  %t270 = call i64 @f64_parse(ptr @.str.exp_ns_2d.34)
  %t271 = xor i64 %t270, -9223372036854775808
  store i64 %t271, ptr %local.a.161
  br label %then6_end
then6_end:
  br label %endif6
else6:
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t272 = phi i64 [ 0, %then6_end ], [ 0, %else6_end ]
  %t273 = load i64, ptr %local.b.162
  %t274 = call i64 @f64_parse(ptr @.str.exp_ns_2d.35)
  %t275 = call i64 @"sx_f64_gt"(i64 %t273, i64 %t274)
  %t276 = icmp ne i64 %t275, 0
  br i1 %t276, label %then7, label %else7
then7:
  %t277 = call i64 @f64_parse(ptr @.str.exp_ns_2d.36)
  store i64 %t277, ptr %local.b.162
  br label %then7_end
then7_end:
  br label %endif7
else7:
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t278 = phi i64 [ 0, %then7_end ], [ 0, %else7_end ]
  %t279 = load i64, ptr %local.b.162
  %t280 = call i64 @f64_parse(ptr @.str.exp_ns_2d.37)
  %t281 = xor i64 %t280, -9223372036854775808
  %t282 = call i64 @"sx_f64_lt"(i64 %t279, i64 %t281)
  %t283 = icmp ne i64 %t282, 0
  br i1 %t283, label %then8, label %else8
then8:
  %t284 = call i64 @f64_parse(ptr @.str.exp_ns_2d.38)
  %t285 = xor i64 %t284, -9223372036854775808
  store i64 %t285, ptr %local.b.162
  br label %then8_end
then8_end:
  br label %endif8
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t286 = phi i64 [ 0, %then8_end ], [ 0, %else8_end ]
  %t287 = load i64, ptr %local.c.163
  %t288 = call i64 @f64_parse(ptr @.str.exp_ns_2d.39)
  %t289 = call i64 @"sx_f64_gt"(i64 %t287, i64 %t288)
  %t290 = icmp ne i64 %t289, 0
  br i1 %t290, label %then9, label %else9
then9:
  %t291 = call i64 @f64_parse(ptr @.str.exp_ns_2d.40)
  store i64 %t291, ptr %local.c.163
  br label %then9_end
then9_end:
  br label %endif9
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t292 = phi i64 [ 0, %then9_end ], [ 0, %else9_end ]
  %t293 = load i64, ptr %local.c.163
  %t294 = call i64 @f64_parse(ptr @.str.exp_ns_2d.41)
  %t295 = xor i64 %t294, -9223372036854775808
  %t296 = call i64 @"sx_f64_lt"(i64 %t293, i64 %t295)
  %t297 = icmp ne i64 %t296, 0
  br i1 %t297, label %then10, label %else10
then10:
  %t298 = call i64 @f64_parse(ptr @.str.exp_ns_2d.42)
  %t299 = xor i64 %t298, -9223372036854775808
  store i64 %t299, ptr %local.c.163
  br label %then10_end
then10_end:
  br label %endif10
else10:
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t300 = phi i64 [ 0, %then10_end ], [ 0, %else10_end ]
  %t301 = load i64, ptr %local.d.164
  %t302 = call i64 @f64_parse(ptr @.str.exp_ns_2d.43)
  %t303 = call i64 @"sx_f64_gt"(i64 %t301, i64 %t302)
  %t304 = icmp ne i64 %t303, 0
  br i1 %t304, label %then11, label %else11
then11:
  %t305 = call i64 @f64_parse(ptr @.str.exp_ns_2d.44)
  store i64 %t305, ptr %local.d.164
  br label %then11_end
then11_end:
  br label %endif11
else11:
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t306 = phi i64 [ 0, %then11_end ], [ 0, %else11_end ]
  %t307 = load i64, ptr %local.d.164
  %t308 = call i64 @f64_parse(ptr @.str.exp_ns_2d.45)
  %t309 = xor i64 %t308, -9223372036854775808
  %t310 = call i64 @"sx_f64_lt"(i64 %t307, i64 %t309)
  %t311 = icmp ne i64 %t310, 0
  br i1 %t311, label %then12, label %else12
then12:
  %t312 = call i64 @f64_parse(ptr @.str.exp_ns_2d.46)
  %t313 = xor i64 %t312, -9223372036854775808
  store i64 %t313, ptr %local.d.164
  br label %then12_end
then12_end:
  br label %endif12
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t314 = phi i64 [ 0, %then12_end ], [ 0, %else12_end ]
  %t315 = load i64, ptr %local.a.161
  %t316 = load i64, ptr %local.b.162
  %t317 = load i64, ptr %local.c.163
  %t318 = load i64, ptr %local.d.164
  %t319 = call i64 @"energy"(i64 %t315, i64 %t316, i64 %t317, i64 %t318)
  store i64 %t319, ptr %local.e_now.181
  %t320 = load i64, ptr %local.e_now.181
  %t321 = load i64, ptr %local.prev_e.166
  %t322 = call i64 @"sx_f64_sub"(i64 %t320, i64 %t321)
  %t323 = call i64 @"abs_f64"(i64 %t322)
  store i64 %t323, ptr %local.drift.182
  %t324 = load i64, ptr %local.step.165
  %t325 = icmp sge i64 %t324, 200
  %t326 = zext i1 %t325 to i64
  %t327 = icmp ne i64 %t326, 0
  br i1 %t327, label %then13, label %else13
then13:
  %t328 = load i64, ptr %local.step.165
  %t329 = icmp slt i64 %t328, 600
  %t330 = zext i1 %t329 to i64
  %t331 = icmp ne i64 %t330, 0
  br i1 %t331, label %then14, label %else14
then14:
  %t332 = load i64, ptr %local.early_drift.167
  %t333 = load i64, ptr %local.drift.182
  %t334 = call i64 @"sx_f64_add"(i64 %t332, i64 %t333)
  store i64 %t334, ptr %local.early_drift.167
  %t335 = load i64, ptr %local.count_e.169
  %t336 = add i64 %t335, 1
  store i64 %t336, ptr %local.count_e.169
  br label %then14_end
then14_end:
  br label %endif14
else14:
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t337 = phi i64 [ 0, %then14_end ], [ 0, %else14_end ]
  br label %then13_end
then13_end:
  br label %endif13
else13:
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t338 = phi i64 [ %t337, %then13_end ], [ 0, %else13_end ]
  %t339 = load i64, ptr %local.step.165
  %t340 = icmp sge i64 %t339, 1400
  %t341 = zext i1 %t340 to i64
  %t342 = icmp ne i64 %t341, 0
  br i1 %t342, label %then15, label %else15
then15:
  %t343 = load i64, ptr %local.late_drift.168
  %t344 = load i64, ptr %local.drift.182
  %t345 = call i64 @"sx_f64_add"(i64 %t343, i64 %t344)
  store i64 %t345, ptr %local.late_drift.168
  %t346 = load i64, ptr %local.count_l.170
  %t347 = add i64 %t346, 1
  store i64 %t347, ptr %local.count_l.170
  br label %then15_end
then15_end:
  br label %endif15
else15:
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t348 = phi i64 [ 0, %then15_end ], [ 0, %else15_end ]
  %t349 = load i64, ptr %local.step.165
  %t350 = icmp sge i64 %t349, 1000
  %t351 = zext i1 %t350 to i64
  %t352 = icmp ne i64 %t351, 0
  br i1 %t352, label %then16, label %else16
then16:
  %t353 = load i64, ptr %local.f_da.173
  %t354 = load i64, ptr %local.f_db.174
  %t355 = load i64, ptr %local.f_dc.175
  %t356 = load i64, ptr %local.f_dd.176
  %t357 = load i64, ptr %local.f_na.177
  %t358 = load i64, ptr %local.f_nb.178
  %t359 = load i64, ptr %local.f_nc.179
  %t360 = load i64, ptr %local.f_nd.180
  %t361 = call i64 @"iratio_4vec"(i64 %t353, i64 %t354, i64 %t355, i64 %t356, i64 %t357, i64 %t358, i64 %t359, i64 %t360)
  store i64 %t361, ptr %local.ir.183
  %t362 = load i64, ptr %local.sum_ir.171
  %t363 = load i64, ptr %local.ir.183
  %t364 = call i64 @"sx_f64_add"(i64 %t362, i64 %t363)
  store i64 %t364, ptr %local.sum_ir.171
  %t365 = load i64, ptr %local.count_ir.172
  %t366 = add i64 %t365, 1
  store i64 %t366, ptr %local.count_ir.172
  br label %then16_end
then16_end:
  br label %endif16
else16:
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t367 = phi i64 [ 0, %then16_end ], [ 0, %else16_end ]
  %t368 = load i64, ptr %local.e_now.181
  store i64 %t368, ptr %local.prev_e.166
  %t369 = load i64, ptr %local.step.165
  %t370 = add i64 %t369, 1
  store i64 %t370, ptr %local.step.165
  br label %loop4
endloop4:
  %t371 = load i64, ptr %local.count_e.169
  %t372 = icmp sgt i64 %t371, 0
  %t373 = zext i1 %t372 to i64
  %t374 = icmp ne i64 %t373, 0
  br i1 %t374, label %then17, label %else17
then17:
  %t375 = load i64, ptr %local.early_drift.167
  %t376 = load i64, ptr %local.count_e.169
  %t377 = call i64 @"sx_int_to_f64"(i64 %t376)
  %t378 = call i64 @"sx_f64_div"(i64 %t375, i64 %t377)
  store i64 %t378, ptr %local.early_drift.167
  br label %then17_end
then17_end:
  br label %endif17
else17:
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t379 = phi i64 [ 0, %then17_end ], [ 0, %else17_end ]
  %t380 = load i64, ptr %local.count_l.170
  %t381 = icmp sgt i64 %t380, 0
  %t382 = zext i1 %t381 to i64
  %t383 = icmp ne i64 %t382, 0
  br i1 %t383, label %then18, label %else18
then18:
  %t384 = load i64, ptr %local.late_drift.168
  %t385 = load i64, ptr %local.count_l.170
  %t386 = call i64 @"sx_int_to_f64"(i64 %t385)
  %t387 = call i64 @"sx_f64_div"(i64 %t384, i64 %t386)
  store i64 %t387, ptr %local.late_drift.168
  br label %then18_end
then18_end:
  br label %endif18
else18:
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t388 = phi i64 [ 0, %then18_end ], [ 0, %else18_end ]
  %t389 = call i64 @f64_parse(ptr @.str.exp_ns_2d.47)
  store i64 %t389, ptr %local.avg_ir.184
  %t390 = load i64, ptr %local.count_ir.172
  %t391 = icmp sgt i64 %t390, 0
  %t392 = zext i1 %t391 to i64
  %t393 = icmp ne i64 %t392, 0
  br i1 %t393, label %then19, label %else19
then19:
  %t394 = load i64, ptr %local.sum_ir.171
  %t395 = load i64, ptr %local.count_ir.172
  %t396 = call i64 @"sx_int_to_f64"(i64 %t395)
  %t397 = call i64 @"sx_f64_div"(i64 %t394, i64 %t396)
  store i64 %t397, ptr %local.avg_ir.184
  br label %then19_end
then19_end:
  br label %endif19
else19:
  br label %else19_end
else19_end:
  br label %endif19
endif19:
  %t398 = phi i64 [ 0, %then19_end ], [ 0, %else19_end ]
  %t399 = load i64, ptr %local.early_drift.167
  %t400 = load i64, ptr %local.late_drift.168
  %t401 = call i64 @"s_score"(i64 %t399, i64 %t400)
  store i64 %t401, ptr %local.ss.185
  %t402 = load i64, ptr %local.a.161
  %t403 = load i64, ptr %local.b.162
  %t404 = load i64, ptr %local.c.163
  %t405 = load i64, ptr %local.d.164
  %t406 = call i64 @"energy"(i64 %t402, i64 %t403, i64 %t404, i64 %t405)
  store i64 %t406, ptr %local.e_final.186
  %t407 = load i64, ptr %local.out_mode
  %t408 = icmp eq i64 %t407, 0
  %t409 = zext i1 %t408 to i64
  %t410 = icmp ne i64 %t409, 0
  br i1 %t410, label %then20, label %else20
then20:
  %t411 = load i64, ptr %local.avg_ir.184
  ret i64 %t411
else20:
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t412 = phi i64 [ 0, %else20_end ]
  %t413 = load i64, ptr %local.out_mode
  %t414 = icmp eq i64 %t413, 1
  %t415 = zext i1 %t414 to i64
  %t416 = icmp ne i64 %t415, 0
  br i1 %t416, label %then21, label %else21
then21:
  %t417 = load i64, ptr %local.ss.185
  ret i64 %t417
else21:
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t418 = phi i64 [ 0, %else21_end ]
  %t419 = load i64, ptr %local.out_mode
  %t420 = icmp eq i64 %t419, 2
  %t421 = zext i1 %t420 to i64
  %t422 = icmp ne i64 %t421, 0
  br i1 %t422, label %then22, label %else22
then22:
  %t423 = load i64, ptr %local.e_final.186
  ret i64 %t423
else22:
  br label %else22_end
else22_end:
  br label %endif22
endif22:
  %t424 = phi i64 [ 0, %else22_end ]
  %t425 = load i64, ptr %local.out_mode
  %t426 = icmp eq i64 %t425, 3
  %t427 = zext i1 %t426 to i64
  %t428 = icmp ne i64 %t427, 0
  br i1 %t428, label %then23, label %else23
then23:
  %t429 = load i64, ptr %local.a.161
  %t430 = load i64, ptr %local.a.161
  %t431 = call i64 @"sx_f64_mul"(i64 %t429, i64 %t430)
  %t432 = load i64, ptr %local.b.162
  %t433 = load i64, ptr %local.b.162
  %t434 = call i64 @"sx_f64_mul"(i64 %t432, i64 %t433)
  %t435 = call i64 @"sx_f64_add"(i64 %t431, i64 %t434)
  ret i64 %t435
else23:
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t436 = phi i64 [ 0, %else23_end ]
  %t437 = load i64, ptr %local.out_mode
  %t438 = icmp eq i64 %t437, 4
  %t439 = zext i1 %t438 to i64
  %t440 = icmp ne i64 %t439, 0
  br i1 %t440, label %then24, label %else24
then24:
  %t441 = load i64, ptr %local.c.163
  %t442 = load i64, ptr %local.c.163
  %t443 = call i64 @"sx_f64_mul"(i64 %t441, i64 %t442)
  %t444 = load i64, ptr %local.d.164
  %t445 = load i64, ptr %local.d.164
  %t446 = call i64 @"sx_f64_mul"(i64 %t444, i64 %t445)
  %t447 = call i64 @"sx_f64_add"(i64 %t443, i64 %t446)
  ret i64 %t447
else24:
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t448 = phi i64 [ 0, %else24_end ]
  %t449 = call i64 @f64_parse(ptr @.str.exp_ns_2d.48)
  ret i64 %t449
}

define i64 @"test_viscosity_sweep"() nounwind {
entry:
  %local.sweep.450 = alloca i64
  %local.nu.451 = alloca i64
  %local.ir.452 = alloca i64
  %local.ss.453 = alloca i64
  %local.en.454 = alloca i64
  %t455 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.49)
  %t456 = ptrtoint ptr %t455 to i64
  %t457 = inttoptr i64 %t456 to ptr
  call void @intrinsic_println(ptr %t457)
  %t458 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.50)
  %t459 = ptrtoint ptr %t458 to i64
  %t460 = inttoptr i64 %t459 to ptr
  call void @intrinsic_println(ptr %t460)
  %t461 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.51)
  %t462 = ptrtoint ptr %t461 to i64
  %t463 = inttoptr i64 %t462 to ptr
  call void @intrinsic_println(ptr %t463)
  %t464 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.52)
  %t465 = ptrtoint ptr %t464 to i64
  %t466 = inttoptr i64 %t465 to ptr
  call void @intrinsic_println(ptr %t466)
  %t467 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.53)
  %t468 = ptrtoint ptr %t467 to i64
  %t469 = inttoptr i64 %t468 to ptr
  call void @intrinsic_println(ptr %t469)
  %t470 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.54)
  %t471 = ptrtoint ptr %t470 to i64
  %t472 = inttoptr i64 %t471 to ptr
  call void @intrinsic_println(ptr %t472)
  %t473 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.55)
  %t474 = ptrtoint ptr %t473 to i64
  %t475 = inttoptr i64 %t474 to ptr
  call void @intrinsic_println(ptr %t475)
  %t476 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.56)
  %t477 = ptrtoint ptr %t476 to i64
  %t478 = inttoptr i64 %t477 to ptr
  call void @intrinsic_println(ptr %t478)
  %t479 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.57)
  %t480 = ptrtoint ptr %t479 to i64
  %t481 = inttoptr i64 %t480 to ptr
  call void @intrinsic_println(ptr %t481)
  %t482 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.58)
  %t483 = ptrtoint ptr %t482 to i64
  %t484 = inttoptr i64 %t483 to ptr
  call void @intrinsic_println(ptr %t484)
  store i64 0, ptr %local.sweep.450
  br label %loop25
loop25:
  %t485 = load i64, ptr %local.sweep.450
  %t486 = icmp slt i64 %t485, 10
  %t487 = zext i1 %t486 to i64
  %t488 = icmp ne i64 %t487, 0
  br i1 %t488, label %body25, label %endloop25
body25:
  %t489 = call i64 @f64_parse(ptr @.str.exp_ns_2d.59)
  store i64 %t489, ptr %local.nu.451
  %t490 = load i64, ptr %local.sweep.450
  %t491 = icmp eq i64 %t490, 0
  %t492 = zext i1 %t491 to i64
  %t493 = icmp ne i64 %t492, 0
  br i1 %t493, label %then26, label %else26
then26:
  %t494 = call i64 @f64_parse(ptr @.str.exp_ns_2d.60)
  store i64 %t494, ptr %local.nu.451
  br label %then26_end
then26_end:
  br label %endif26
else26:
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t495 = phi i64 [ 0, %then26_end ], [ 0, %else26_end ]
  %t496 = load i64, ptr %local.sweep.450
  %t497 = icmp eq i64 %t496, 1
  %t498 = zext i1 %t497 to i64
  %t499 = icmp ne i64 %t498, 0
  br i1 %t499, label %then27, label %else27
then27:
  %t500 = call i64 @f64_parse(ptr @.str.exp_ns_2d.61)
  store i64 %t500, ptr %local.nu.451
  br label %then27_end
then27_end:
  br label %endif27
else27:
  br label %else27_end
else27_end:
  br label %endif27
endif27:
  %t501 = phi i64 [ 0, %then27_end ], [ 0, %else27_end ]
  %t502 = load i64, ptr %local.sweep.450
  %t503 = icmp eq i64 %t502, 2
  %t504 = zext i1 %t503 to i64
  %t505 = icmp ne i64 %t504, 0
  br i1 %t505, label %then28, label %else28
then28:
  %t506 = call i64 @f64_parse(ptr @.str.exp_ns_2d.62)
  store i64 %t506, ptr %local.nu.451
  br label %then28_end
then28_end:
  br label %endif28
else28:
  br label %else28_end
else28_end:
  br label %endif28
endif28:
  %t507 = phi i64 [ 0, %then28_end ], [ 0, %else28_end ]
  %t508 = load i64, ptr %local.sweep.450
  %t509 = icmp eq i64 %t508, 3
  %t510 = zext i1 %t509 to i64
  %t511 = icmp ne i64 %t510, 0
  br i1 %t511, label %then29, label %else29
then29:
  %t512 = call i64 @f64_parse(ptr @.str.exp_ns_2d.63)
  store i64 %t512, ptr %local.nu.451
  br label %then29_end
then29_end:
  br label %endif29
else29:
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t513 = phi i64 [ 0, %then29_end ], [ 0, %else29_end ]
  %t514 = load i64, ptr %local.sweep.450
  %t515 = icmp eq i64 %t514, 4
  %t516 = zext i1 %t515 to i64
  %t517 = icmp ne i64 %t516, 0
  br i1 %t517, label %then30, label %else30
then30:
  %t518 = call i64 @f64_parse(ptr @.str.exp_ns_2d.64)
  store i64 %t518, ptr %local.nu.451
  br label %then30_end
then30_end:
  br label %endif30
else30:
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t519 = phi i64 [ 0, %then30_end ], [ 0, %else30_end ]
  %t520 = load i64, ptr %local.sweep.450
  %t521 = icmp eq i64 %t520, 5
  %t522 = zext i1 %t521 to i64
  %t523 = icmp ne i64 %t522, 0
  br i1 %t523, label %then31, label %else31
then31:
  %t524 = call i64 @f64_parse(ptr @.str.exp_ns_2d.65)
  store i64 %t524, ptr %local.nu.451
  br label %then31_end
then31_end:
  br label %endif31
else31:
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t525 = phi i64 [ 0, %then31_end ], [ 0, %else31_end ]
  %t526 = load i64, ptr %local.sweep.450
  %t527 = icmp eq i64 %t526, 6
  %t528 = zext i1 %t527 to i64
  %t529 = icmp ne i64 %t528, 0
  br i1 %t529, label %then32, label %else32
then32:
  %t530 = call i64 @f64_parse(ptr @.str.exp_ns_2d.66)
  store i64 %t530, ptr %local.nu.451
  br label %then32_end
then32_end:
  br label %endif32
else32:
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t531 = phi i64 [ 0, %then32_end ], [ 0, %else32_end ]
  %t532 = load i64, ptr %local.sweep.450
  %t533 = icmp eq i64 %t532, 7
  %t534 = zext i1 %t533 to i64
  %t535 = icmp ne i64 %t534, 0
  br i1 %t535, label %then33, label %else33
then33:
  %t536 = call i64 @f64_parse(ptr @.str.exp_ns_2d.67)
  store i64 %t536, ptr %local.nu.451
  br label %then33_end
then33_end:
  br label %endif33
else33:
  br label %else33_end
else33_end:
  br label %endif33
endif33:
  %t537 = phi i64 [ 0, %then33_end ], [ 0, %else33_end ]
  %t538 = load i64, ptr %local.sweep.450
  %t539 = icmp eq i64 %t538, 8
  %t540 = zext i1 %t539 to i64
  %t541 = icmp ne i64 %t540, 0
  br i1 %t541, label %then34, label %else34
then34:
  %t542 = call i64 @f64_parse(ptr @.str.exp_ns_2d.68)
  store i64 %t542, ptr %local.nu.451
  br label %then34_end
then34_end:
  br label %endif34
else34:
  br label %else34_end
else34_end:
  br label %endif34
endif34:
  %t543 = phi i64 [ 0, %then34_end ], [ 0, %else34_end ]
  %t544 = load i64, ptr %local.sweep.450
  %t545 = icmp eq i64 %t544, 9
  %t546 = zext i1 %t545 to i64
  %t547 = icmp ne i64 %t546, 0
  br i1 %t547, label %then35, label %else35
then35:
  %t548 = call i64 @f64_parse(ptr @.str.exp_ns_2d.69)
  store i64 %t548, ptr %local.nu.451
  br label %then35_end
then35_end:
  br label %endif35
else35:
  br label %else35_end
else35_end:
  br label %endif35
endif35:
  %t549 = phi i64 [ 0, %then35_end ], [ 0, %else35_end ]
  %t550 = load i64, ptr %local.nu.451
  %t551 = call i64 @"run_2d_sim"(i64 %t550, i64 0)
  store i64 %t551, ptr %local.ir.452
  %t552 = load i64, ptr %local.nu.451
  %t553 = call i64 @"run_2d_sim"(i64 %t552, i64 1)
  store i64 %t553, ptr %local.ss.453
  %t554 = load i64, ptr %local.nu.451
  %t555 = call i64 @"run_2d_sim"(i64 %t554, i64 2)
  store i64 %t555, ptr %local.en.454
  %t556 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.70)
  %t557 = ptrtoint ptr %t556 to i64
  %t558 = inttoptr i64 %t557 to ptr
  call void @intrinsic_print(ptr %t558)
  %t559 = load i64, ptr %local.nu.451
  %t560 = call i64 @"print_f64"(i64 %t559)
  %t561 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.71)
  %t562 = ptrtoint ptr %t561 to i64
  %t563 = inttoptr i64 %t562 to ptr
  call void @intrinsic_print(ptr %t563)
  %t564 = load i64, ptr %local.ir.452
  %t565 = call i64 @"print_f64"(i64 %t564)
  %t566 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.72)
  %t567 = ptrtoint ptr %t566 to i64
  %t568 = inttoptr i64 %t567 to ptr
  call void @intrinsic_print(ptr %t568)
  %t569 = load i64, ptr %local.ss.453
  %t570 = call i64 @"print_f64"(i64 %t569)
  %t571 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.73)
  %t572 = ptrtoint ptr %t571 to i64
  %t573 = inttoptr i64 %t572 to ptr
  call void @intrinsic_print(ptr %t573)
  %t574 = load i64, ptr %local.en.454
  %t575 = call i64 @"print_f64"(i64 %t574)
  %t576 = load i64, ptr %local.ir.452
  %t577 = call i64 @f64_parse(ptr @.str.exp_ns_2d.74)
  %t578 = call i64 @"sx_f64_add"(i64 %t576, i64 %t577)
  %t579 = call i64 @"abs_f64"(i64 %t578)
  %t580 = call i64 @f64_parse(ptr @.str.exp_ns_2d.75)
  %t581 = call i64 @"sx_f64_lt"(i64 %t579, i64 %t580)
  %t582 = icmp ne i64 %t581, 0
  br i1 %t582, label %then36, label %else36
then36:
  %t583 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.76)
  %t584 = ptrtoint ptr %t583 to i64
  %t585 = inttoptr i64 %t584 to ptr
  call void @intrinsic_println(ptr %t585)
  br label %then36_end
then36_end:
  br label %endif36
else36:
  %t586 = load i64, ptr %local.ss.453
  %t587 = call i64 @f64_parse(ptr @.str.exp_ns_2d.77)
  %t588 = call i64 @"sx_f64_lt"(i64 %t586, i64 %t587)
  %t589 = icmp ne i64 %t588, 0
  br i1 %t589, label %then37, label %else37
then37:
  %t590 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.78)
  %t591 = ptrtoint ptr %t590 to i64
  %t592 = inttoptr i64 %t591 to ptr
  call void @intrinsic_println(ptr %t592)
  br label %then37_end
then37_end:
  br label %endif37
else37:
  %t593 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.79)
  %t594 = ptrtoint ptr %t593 to i64
  %t595 = inttoptr i64 %t594 to ptr
  call void @intrinsic_println(ptr %t595)
  br label %else37_end
else37_end:
  br label %endif37
endif37:
  %t596 = phi i64 [ 0, %then37_end ], [ 0, %else37_end ]
  br label %else36_end
else36_end:
  br label %endif36
endif36:
  %t597 = phi i64 [ 0, %then36_end ], [ %t596, %else36_end ]
  %t598 = load i64, ptr %local.sweep.450
  %t599 = add i64 %t598, 1
  store i64 %t599, ptr %local.sweep.450
  br label %loop25
endloop25:
  %t600 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.80)
  %t601 = ptrtoint ptr %t600 to i64
  %t602 = inttoptr i64 %t601 to ptr
  call void @intrinsic_println(ptr %t602)
  %t603 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.81)
  %t604 = ptrtoint ptr %t603 to i64
  %t605 = inttoptr i64 %t604 to ptr
  call void @intrinsic_println(ptr %t605)
  %t606 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.82)
  %t607 = ptrtoint ptr %t606 to i64
  %t608 = inttoptr i64 %t607 to ptr
  call void @intrinsic_println(ptr %t608)
  %t609 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.83)
  %t610 = ptrtoint ptr %t609 to i64
  %t611 = inttoptr i64 %t610 to ptr
  call void @intrinsic_println(ptr %t611)
  %t612 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.84)
  %t613 = ptrtoint ptr %t612 to i64
  %t614 = inttoptr i64 %t613 to ptr
  call void @intrinsic_println(ptr %t614)
  ret i64 0
}

define i64 @"test_energy_cascade"() nounwind {
entry:
  %local.sweep.615 = alloca i64
  %local.nu.616 = alloca i64
  %local.e_large.617 = alloca i64
  %local.e_small.618 = alloca i64
  %local.e_total.619 = alloca i64
  %local.ratio.620 = alloca i64
  %t621 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.85)
  %t622 = ptrtoint ptr %t621 to i64
  %t623 = inttoptr i64 %t622 to ptr
  call void @intrinsic_println(ptr %t623)
  %t624 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.86)
  %t625 = ptrtoint ptr %t624 to i64
  %t626 = inttoptr i64 %t625 to ptr
  call void @intrinsic_println(ptr %t626)
  %t627 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.87)
  %t628 = ptrtoint ptr %t627 to i64
  %t629 = inttoptr i64 %t628 to ptr
  call void @intrinsic_println(ptr %t629)
  %t630 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.88)
  %t631 = ptrtoint ptr %t630 to i64
  %t632 = inttoptr i64 %t631 to ptr
  call void @intrinsic_println(ptr %t632)
  %t633 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.89)
  %t634 = ptrtoint ptr %t633 to i64
  %t635 = inttoptr i64 %t634 to ptr
  call void @intrinsic_println(ptr %t635)
  %t636 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.90)
  %t637 = ptrtoint ptr %t636 to i64
  %t638 = inttoptr i64 %t637 to ptr
  call void @intrinsic_println(ptr %t638)
  %t639 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.91)
  %t640 = ptrtoint ptr %t639 to i64
  %t641 = inttoptr i64 %t640 to ptr
  call void @intrinsic_println(ptr %t641)
  %t642 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.92)
  %t643 = ptrtoint ptr %t642 to i64
  %t644 = inttoptr i64 %t643 to ptr
  call void @intrinsic_println(ptr %t644)
  store i64 0, ptr %local.sweep.615
  br label %loop38
loop38:
  %t645 = load i64, ptr %local.sweep.615
  %t646 = icmp slt i64 %t645, 8
  %t647 = zext i1 %t646 to i64
  %t648 = icmp ne i64 %t647, 0
  br i1 %t648, label %body38, label %endloop38
body38:
  %t649 = call i64 @f64_parse(ptr @.str.exp_ns_2d.93)
  store i64 %t649, ptr %local.nu.616
  %t650 = load i64, ptr %local.sweep.615
  %t651 = icmp eq i64 %t650, 0
  %t652 = zext i1 %t651 to i64
  %t653 = icmp ne i64 %t652, 0
  br i1 %t653, label %then39, label %else39
then39:
  %t654 = call i64 @f64_parse(ptr @.str.exp_ns_2d.94)
  store i64 %t654, ptr %local.nu.616
  br label %then39_end
then39_end:
  br label %endif39
else39:
  br label %else39_end
else39_end:
  br label %endif39
endif39:
  %t655 = phi i64 [ 0, %then39_end ], [ 0, %else39_end ]
  %t656 = load i64, ptr %local.sweep.615
  %t657 = icmp eq i64 %t656, 1
  %t658 = zext i1 %t657 to i64
  %t659 = icmp ne i64 %t658, 0
  br i1 %t659, label %then40, label %else40
then40:
  %t660 = call i64 @f64_parse(ptr @.str.exp_ns_2d.95)
  store i64 %t660, ptr %local.nu.616
  br label %then40_end
then40_end:
  br label %endif40
else40:
  br label %else40_end
else40_end:
  br label %endif40
endif40:
  %t661 = phi i64 [ 0, %then40_end ], [ 0, %else40_end ]
  %t662 = load i64, ptr %local.sweep.615
  %t663 = icmp eq i64 %t662, 2
  %t664 = zext i1 %t663 to i64
  %t665 = icmp ne i64 %t664, 0
  br i1 %t665, label %then41, label %else41
then41:
  %t666 = call i64 @f64_parse(ptr @.str.exp_ns_2d.96)
  store i64 %t666, ptr %local.nu.616
  br label %then41_end
then41_end:
  br label %endif41
else41:
  br label %else41_end
else41_end:
  br label %endif41
endif41:
  %t667 = phi i64 [ 0, %then41_end ], [ 0, %else41_end ]
  %t668 = load i64, ptr %local.sweep.615
  %t669 = icmp eq i64 %t668, 3
  %t670 = zext i1 %t669 to i64
  %t671 = icmp ne i64 %t670, 0
  br i1 %t671, label %then42, label %else42
then42:
  %t672 = call i64 @f64_parse(ptr @.str.exp_ns_2d.97)
  store i64 %t672, ptr %local.nu.616
  br label %then42_end
then42_end:
  br label %endif42
else42:
  br label %else42_end
else42_end:
  br label %endif42
endif42:
  %t673 = phi i64 [ 0, %then42_end ], [ 0, %else42_end ]
  %t674 = load i64, ptr %local.sweep.615
  %t675 = icmp eq i64 %t674, 4
  %t676 = zext i1 %t675 to i64
  %t677 = icmp ne i64 %t676, 0
  br i1 %t677, label %then43, label %else43
then43:
  %t678 = call i64 @f64_parse(ptr @.str.exp_ns_2d.98)
  store i64 %t678, ptr %local.nu.616
  br label %then43_end
then43_end:
  br label %endif43
else43:
  br label %else43_end
else43_end:
  br label %endif43
endif43:
  %t679 = phi i64 [ 0, %then43_end ], [ 0, %else43_end ]
  %t680 = load i64, ptr %local.sweep.615
  %t681 = icmp eq i64 %t680, 5
  %t682 = zext i1 %t681 to i64
  %t683 = icmp ne i64 %t682, 0
  br i1 %t683, label %then44, label %else44
then44:
  %t684 = call i64 @f64_parse(ptr @.str.exp_ns_2d.99)
  store i64 %t684, ptr %local.nu.616
  br label %then44_end
then44_end:
  br label %endif44
else44:
  br label %else44_end
else44_end:
  br label %endif44
endif44:
  %t685 = phi i64 [ 0, %then44_end ], [ 0, %else44_end ]
  %t686 = load i64, ptr %local.sweep.615
  %t687 = icmp eq i64 %t686, 6
  %t688 = zext i1 %t687 to i64
  %t689 = icmp ne i64 %t688, 0
  br i1 %t689, label %then45, label %else45
then45:
  %t690 = call i64 @f64_parse(ptr @.str.exp_ns_2d.100)
  store i64 %t690, ptr %local.nu.616
  br label %then45_end
then45_end:
  br label %endif45
else45:
  br label %else45_end
else45_end:
  br label %endif45
endif45:
  %t691 = phi i64 [ 0, %then45_end ], [ 0, %else45_end ]
  %t692 = load i64, ptr %local.sweep.615
  %t693 = icmp eq i64 %t692, 7
  %t694 = zext i1 %t693 to i64
  %t695 = icmp ne i64 %t694, 0
  br i1 %t695, label %then46, label %else46
then46:
  %t696 = call i64 @f64_parse(ptr @.str.exp_ns_2d.101)
  store i64 %t696, ptr %local.nu.616
  br label %then46_end
then46_end:
  br label %endif46
else46:
  br label %else46_end
else46_end:
  br label %endif46
endif46:
  %t697 = phi i64 [ 0, %then46_end ], [ 0, %else46_end ]
  %t698 = load i64, ptr %local.nu.616
  %t699 = call i64 @"run_2d_sim"(i64 %t698, i64 3)
  store i64 %t699, ptr %local.e_large.617
  %t700 = load i64, ptr %local.nu.616
  %t701 = call i64 @"run_2d_sim"(i64 %t700, i64 4)
  store i64 %t701, ptr %local.e_small.618
  %t702 = load i64, ptr %local.e_large.617
  %t703 = load i64, ptr %local.e_small.618
  %t704 = call i64 @"sx_f64_add"(i64 %t702, i64 %t703)
  store i64 %t704, ptr %local.e_total.619
  %t705 = call i64 @f64_parse(ptr @.str.exp_ns_2d.102)
  store i64 %t705, ptr %local.ratio.620
  %t706 = load i64, ptr %local.e_total.619
  %t707 = call i64 @f64_parse(ptr @.str.exp_ns_2d.103)
  %t708 = call i64 @"sx_f64_gt"(i64 %t706, i64 %t707)
  %t709 = icmp ne i64 %t708, 0
  br i1 %t709, label %then47, label %else47
then47:
  %t710 = load i64, ptr %local.e_large.617
  %t711 = load i64, ptr %local.e_total.619
  %t712 = call i64 @"sx_f64_div"(i64 %t710, i64 %t711)
  store i64 %t712, ptr %local.ratio.620
  br label %then47_end
then47_end:
  br label %endif47
else47:
  br label %else47_end
else47_end:
  br label %endif47
endif47:
  %t713 = phi i64 [ 0, %then47_end ], [ 0, %else47_end ]
  %t714 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.104)
  %t715 = ptrtoint ptr %t714 to i64
  %t716 = inttoptr i64 %t715 to ptr
  call void @intrinsic_print(ptr %t716)
  %t717 = load i64, ptr %local.nu.616
  %t718 = call i64 @"print_f64"(i64 %t717)
  %t719 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.105)
  %t720 = ptrtoint ptr %t719 to i64
  %t721 = inttoptr i64 %t720 to ptr
  call void @intrinsic_print(ptr %t721)
  %t722 = load i64, ptr %local.e_large.617
  %t723 = call i64 @"print_f64"(i64 %t722)
  %t724 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.106)
  %t725 = ptrtoint ptr %t724 to i64
  %t726 = inttoptr i64 %t725 to ptr
  call void @intrinsic_print(ptr %t726)
  %t727 = load i64, ptr %local.e_small.618
  %t728 = call i64 @"print_f64"(i64 %t727)
  %t729 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.107)
  %t730 = ptrtoint ptr %t729 to i64
  %t731 = inttoptr i64 %t730 to ptr
  call void @intrinsic_print(ptr %t731)
  %t732 = load i64, ptr %local.ratio.620
  %t733 = call i64 @"print_f64"(i64 %t732)
  %t734 = load i64, ptr %local.ratio.620
  %t735 = call i64 @f64_parse(ptr @.str.exp_ns_2d.108)
  %t736 = call i64 @"sx_f64_gt"(i64 %t734, i64 %t735)
  %t737 = icmp ne i64 %t736, 0
  br i1 %t737, label %then48, label %else48
then48:
  %t738 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.109)
  %t739 = ptrtoint ptr %t738 to i64
  %t740 = inttoptr i64 %t739 to ptr
  call void @intrinsic_println(ptr %t740)
  br label %then48_end
then48_end:
  br label %endif48
else48:
  %t741 = load i64, ptr %local.ratio.620
  %t742 = call i64 @f64_parse(ptr @.str.exp_ns_2d.110)
  %t743 = call i64 @"sx_f64_lt"(i64 %t741, i64 %t742)
  %t744 = icmp ne i64 %t743, 0
  br i1 %t744, label %then49, label %else49
then49:
  %t745 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.111)
  %t746 = ptrtoint ptr %t745 to i64
  %t747 = inttoptr i64 %t746 to ptr
  call void @intrinsic_println(ptr %t747)
  br label %then49_end
then49_end:
  br label %endif49
else49:
  %t748 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.112)
  %t749 = ptrtoint ptr %t748 to i64
  %t750 = inttoptr i64 %t749 to ptr
  call void @intrinsic_println(ptr %t750)
  br label %else49_end
else49_end:
  br label %endif49
endif49:
  %t751 = phi i64 [ 0, %then49_end ], [ 0, %else49_end ]
  br label %else48_end
else48_end:
  br label %endif48
endif48:
  %t752 = phi i64 [ 0, %then48_end ], [ %t751, %else48_end ]
  %t753 = load i64, ptr %local.sweep.615
  %t754 = add i64 %t753, 1
  store i64 %t754, ptr %local.sweep.615
  br label %loop38
endloop38:
  %t755 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.113)
  %t756 = ptrtoint ptr %t755 to i64
  %t757 = inttoptr i64 %t756 to ptr
  call void @intrinsic_println(ptr %t757)
  %t758 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.114)
  %t759 = ptrtoint ptr %t758 to i64
  %t760 = inttoptr i64 %t759 to ptr
  call void @intrinsic_println(ptr %t760)
  %t761 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.115)
  %t762 = ptrtoint ptr %t761 to i64
  %t763 = inttoptr i64 %t762 to ptr
  call void @intrinsic_println(ptr %t763)
  %t764 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.116)
  %t765 = ptrtoint ptr %t764 to i64
  %t766 = inttoptr i64 %t765 to ptr
  call void @intrinsic_println(ptr %t766)
  %t767 = call i64 @f64_parse(ptr @.str.exp_ns_2d.117)
  %t768 = call i64 @"test_cascade_detail"(i64 %t767)
  %t769 = call i64 @f64_parse(ptr @.str.exp_ns_2d.118)
  %t770 = call i64 @"test_cascade_detail"(i64 %t769)
  %t771 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.119)
  %t772 = ptrtoint ptr %t771 to i64
  %t773 = inttoptr i64 %t772 to ptr
  call void @intrinsic_println(ptr %t773)
  %t774 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.120)
  %t775 = ptrtoint ptr %t774 to i64
  %t776 = inttoptr i64 %t775 to ptr
  call void @intrinsic_println(ptr %t776)
  %t777 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.121)
  %t778 = ptrtoint ptr %t777 to i64
  %t779 = inttoptr i64 %t778 to ptr
  call void @intrinsic_println(ptr %t779)
  %t780 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.122)
  %t781 = ptrtoint ptr %t780 to i64
  %t782 = inttoptr i64 %t781 to ptr
  call void @intrinsic_println(ptr %t782)
  %t783 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.123)
  %t784 = ptrtoint ptr %t783 to i64
  %t785 = inttoptr i64 %t784 to ptr
  call void @intrinsic_println(ptr %t785)
  ret i64 0
}

define i64 @"test_cascade_detail"(i64 %nu) nounwind {
entry:
  %local.dt.786 = alloca i64
  %local.a.787 = alloca i64
  %local.b.788 = alloca i64
  %local.c.789 = alloca i64
  %local.d.790 = alloca i64
  %local.step.791 = alloca i64
  %local.sum_ls.792 = alloca i64
  %local.sum_sl.793 = alloca i64
  %local.count.794 = alloca i64
  %local.p_large.795 = alloca i64
  %local.p_small.796 = alloca i64
  %local.f_da.797 = alloca i64
  %local.f_db.798 = alloca i64
  %local.f_dc.799 = alloca i64
  %local.f_dd.800 = alloca i64
  %local.f_na.801 = alloca i64
  %local.f_nb.802 = alloca i64
  %local.f_nc.803 = alloca i64
  %local.f_nd.804 = alloca i64
  %local.avg_ls.805 = alloca i64
  %local.avg_sl.806 = alloca i64
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %t807 = call i64 @f64_parse(ptr @.str.exp_ns_2d.124)
  store i64 %t807, ptr %local.dt.786
  %t808 = call i64 @f64_parse(ptr @.str.exp_ns_2d.125)
  store i64 %t808, ptr %local.a.787
  %t809 = call i64 @f64_parse(ptr @.str.exp_ns_2d.126)
  store i64 %t809, ptr %local.b.788
  %t810 = call i64 @f64_parse(ptr @.str.exp_ns_2d.127)
  store i64 %t810, ptr %local.c.789
  %t811 = call i64 @f64_parse(ptr @.str.exp_ns_2d.128)
  store i64 %t811, ptr %local.d.790
  store i64 0, ptr %local.step.791
  %t812 = call i64 @f64_parse(ptr @.str.exp_ns_2d.129)
  store i64 %t812, ptr %local.sum_ls.792
  %t813 = call i64 @f64_parse(ptr @.str.exp_ns_2d.130)
  store i64 %t813, ptr %local.sum_sl.793
  store i64 0, ptr %local.count.794
  br label %loop50
loop50:
  %t814 = load i64, ptr %local.step.791
  %t815 = icmp slt i64 %t814, 2000
  %t816 = zext i1 %t815 to i64
  %t817 = icmp ne i64 %t816, 0
  br i1 %t817, label %body50, label %endloop50
body50:
  %t818 = load i64, ptr %local.a.787
  %t819 = load i64, ptr %local.b.788
  %t820 = load i64, ptr %local.c.789
  %t821 = load i64, ptr %local.d.790
  %t822 = call i64 @"nl_a"(i64 %t819, i64 %t820, i64 %t821)
  %t823 = call i64 @"sx_f64_mul"(i64 %t818, i64 %t822)
  %t824 = load i64, ptr %local.b.788
  %t825 = load i64, ptr %local.a.787
  %t826 = load i64, ptr %local.c.789
  %t827 = load i64, ptr %local.d.790
  %t828 = call i64 @"nl_b"(i64 %t825, i64 %t826, i64 %t827)
  %t829 = call i64 @"sx_f64_mul"(i64 %t824, i64 %t828)
  %t830 = call i64 @"sx_f64_add"(i64 %t823, i64 %t829)
  store i64 %t830, ptr %local.p_large.795
  %t831 = load i64, ptr %local.c.789
  %t832 = load i64, ptr %local.a.787
  %t833 = load i64, ptr %local.b.788
  %t834 = call i64 @"nl_c"(i64 %t832, i64 %t833)
  %t835 = call i64 @"sx_f64_mul"(i64 %t831, i64 %t834)
  %t836 = load i64, ptr %local.d.790
  %t837 = load i64, ptr %local.a.787
  %t838 = load i64, ptr %local.b.788
  %t839 = call i64 @"nl_d"(i64 %t837, i64 %t838)
  %t840 = call i64 @"sx_f64_mul"(i64 %t836, i64 %t839)
  %t841 = call i64 @"sx_f64_add"(i64 %t835, i64 %t840)
  store i64 %t841, ptr %local.p_small.796
  %t842 = load i64, ptr %local.step.791
  %t843 = icmp sge i64 %t842, 500
  %t844 = zext i1 %t843 to i64
  %t845 = icmp ne i64 %t844, 0
  br i1 %t845, label %then51, label %else51
then51:
  %t846 = load i64, ptr %local.sum_ls.792
  %t847 = load i64, ptr %local.p_small.796
  %t848 = call i64 @"sx_f64_add"(i64 %t846, i64 %t847)
  store i64 %t848, ptr %local.sum_ls.792
  %t849 = load i64, ptr %local.sum_sl.793
  %t850 = load i64, ptr %local.p_large.795
  %t851 = call i64 @"sx_f64_add"(i64 %t849, i64 %t850)
  store i64 %t851, ptr %local.sum_sl.793
  %t852 = load i64, ptr %local.count.794
  %t853 = add i64 %t852, 1
  store i64 %t853, ptr %local.count.794
  br label %then51_end
then51_end:
  br label %endif51
else51:
  br label %else51_end
else51_end:
  br label %endif51
endif51:
  %t854 = phi i64 [ 0, %then51_end ], [ 0, %else51_end ]
  %t855 = load i64, ptr %local.a.787
  %t856 = load i64, ptr %local.nu
  %t857 = call i64 @"diff_a"(i64 %t855, i64 %t856)
  store i64 %t857, ptr %local.f_da.797
  %t858 = load i64, ptr %local.b.788
  %t859 = load i64, ptr %local.nu
  %t860 = call i64 @"diff_b"(i64 %t858, i64 %t859)
  store i64 %t860, ptr %local.f_db.798
  %t861 = load i64, ptr %local.c.789
  %t862 = load i64, ptr %local.nu
  %t863 = call i64 @"diff_c"(i64 %t861, i64 %t862)
  store i64 %t863, ptr %local.f_dc.799
  %t864 = load i64, ptr %local.d.790
  %t865 = load i64, ptr %local.nu
  %t866 = call i64 @"diff_d"(i64 %t864, i64 %t865)
  store i64 %t866, ptr %local.f_dd.800
  %t867 = load i64, ptr %local.b.788
  %t868 = load i64, ptr %local.c.789
  %t869 = load i64, ptr %local.d.790
  %t870 = call i64 @"nl_a"(i64 %t867, i64 %t868, i64 %t869)
  store i64 %t870, ptr %local.f_na.801
  %t871 = load i64, ptr %local.a.787
  %t872 = load i64, ptr %local.c.789
  %t873 = load i64, ptr %local.d.790
  %t874 = call i64 @"nl_b"(i64 %t871, i64 %t872, i64 %t873)
  store i64 %t874, ptr %local.f_nb.802
  %t875 = load i64, ptr %local.a.787
  %t876 = load i64, ptr %local.b.788
  %t877 = call i64 @"nl_c"(i64 %t875, i64 %t876)
  store i64 %t877, ptr %local.f_nc.803
  %t878 = load i64, ptr %local.a.787
  %t879 = load i64, ptr %local.b.788
  %t880 = call i64 @"nl_d"(i64 %t878, i64 %t879)
  store i64 %t880, ptr %local.f_nd.804
  %t881 = load i64, ptr %local.a.787
  %t882 = load i64, ptr %local.dt.786
  %t883 = load i64, ptr %local.f_da.797
  %t884 = load i64, ptr %local.f_na.801
  %t885 = call i64 @"sx_f64_add"(i64 %t883, i64 %t884)
  %t886 = call i64 @"sx_f64_mul"(i64 %t882, i64 %t885)
  %t887 = call i64 @"sx_f64_add"(i64 %t881, i64 %t886)
  store i64 %t887, ptr %local.a.787
  %t888 = load i64, ptr %local.b.788
  %t889 = load i64, ptr %local.dt.786
  %t890 = load i64, ptr %local.f_db.798
  %t891 = load i64, ptr %local.f_nb.802
  %t892 = call i64 @"sx_f64_add"(i64 %t890, i64 %t891)
  %t893 = call i64 @"sx_f64_mul"(i64 %t889, i64 %t892)
  %t894 = call i64 @"sx_f64_add"(i64 %t888, i64 %t893)
  store i64 %t894, ptr %local.b.788
  %t895 = load i64, ptr %local.c.789
  %t896 = load i64, ptr %local.dt.786
  %t897 = load i64, ptr %local.f_dc.799
  %t898 = load i64, ptr %local.f_nc.803
  %t899 = call i64 @"sx_f64_add"(i64 %t897, i64 %t898)
  %t900 = call i64 @"sx_f64_mul"(i64 %t896, i64 %t899)
  %t901 = call i64 @"sx_f64_add"(i64 %t895, i64 %t900)
  store i64 %t901, ptr %local.c.789
  %t902 = load i64, ptr %local.d.790
  %t903 = load i64, ptr %local.dt.786
  %t904 = load i64, ptr %local.f_dd.800
  %t905 = load i64, ptr %local.f_nd.804
  %t906 = call i64 @"sx_f64_add"(i64 %t904, i64 %t905)
  %t907 = call i64 @"sx_f64_mul"(i64 %t903, i64 %t906)
  %t908 = call i64 @"sx_f64_add"(i64 %t902, i64 %t907)
  store i64 %t908, ptr %local.d.790
  %t909 = load i64, ptr %local.a.787
  %t910 = call i64 @f64_parse(ptr @.str.exp_ns_2d.131)
  %t911 = call i64 @"sx_f64_gt"(i64 %t909, i64 %t910)
  %t912 = icmp ne i64 %t911, 0
  br i1 %t912, label %then52, label %else52
then52:
  %t913 = call i64 @f64_parse(ptr @.str.exp_ns_2d.132)
  store i64 %t913, ptr %local.a.787
  br label %then52_end
then52_end:
  br label %endif52
else52:
  br label %else52_end
else52_end:
  br label %endif52
endif52:
  %t914 = phi i64 [ 0, %then52_end ], [ 0, %else52_end ]
  %t915 = load i64, ptr %local.a.787
  %t916 = call i64 @f64_parse(ptr @.str.exp_ns_2d.133)
  %t917 = xor i64 %t916, -9223372036854775808
  %t918 = call i64 @"sx_f64_lt"(i64 %t915, i64 %t917)
  %t919 = icmp ne i64 %t918, 0
  br i1 %t919, label %then53, label %else53
then53:
  %t920 = call i64 @f64_parse(ptr @.str.exp_ns_2d.134)
  %t921 = xor i64 %t920, -9223372036854775808
  store i64 %t921, ptr %local.a.787
  br label %then53_end
then53_end:
  br label %endif53
else53:
  br label %else53_end
else53_end:
  br label %endif53
endif53:
  %t922 = phi i64 [ 0, %then53_end ], [ 0, %else53_end ]
  %t923 = load i64, ptr %local.b.788
  %t924 = call i64 @f64_parse(ptr @.str.exp_ns_2d.135)
  %t925 = call i64 @"sx_f64_gt"(i64 %t923, i64 %t924)
  %t926 = icmp ne i64 %t925, 0
  br i1 %t926, label %then54, label %else54
then54:
  %t927 = call i64 @f64_parse(ptr @.str.exp_ns_2d.136)
  store i64 %t927, ptr %local.b.788
  br label %then54_end
then54_end:
  br label %endif54
else54:
  br label %else54_end
else54_end:
  br label %endif54
endif54:
  %t928 = phi i64 [ 0, %then54_end ], [ 0, %else54_end ]
  %t929 = load i64, ptr %local.b.788
  %t930 = call i64 @f64_parse(ptr @.str.exp_ns_2d.137)
  %t931 = xor i64 %t930, -9223372036854775808
  %t932 = call i64 @"sx_f64_lt"(i64 %t929, i64 %t931)
  %t933 = icmp ne i64 %t932, 0
  br i1 %t933, label %then55, label %else55
then55:
  %t934 = call i64 @f64_parse(ptr @.str.exp_ns_2d.138)
  %t935 = xor i64 %t934, -9223372036854775808
  store i64 %t935, ptr %local.b.788
  br label %then55_end
then55_end:
  br label %endif55
else55:
  br label %else55_end
else55_end:
  br label %endif55
endif55:
  %t936 = phi i64 [ 0, %then55_end ], [ 0, %else55_end ]
  %t937 = load i64, ptr %local.c.789
  %t938 = call i64 @f64_parse(ptr @.str.exp_ns_2d.139)
  %t939 = call i64 @"sx_f64_gt"(i64 %t937, i64 %t938)
  %t940 = icmp ne i64 %t939, 0
  br i1 %t940, label %then56, label %else56
then56:
  %t941 = call i64 @f64_parse(ptr @.str.exp_ns_2d.140)
  store i64 %t941, ptr %local.c.789
  br label %then56_end
then56_end:
  br label %endif56
else56:
  br label %else56_end
else56_end:
  br label %endif56
endif56:
  %t942 = phi i64 [ 0, %then56_end ], [ 0, %else56_end ]
  %t943 = load i64, ptr %local.c.789
  %t944 = call i64 @f64_parse(ptr @.str.exp_ns_2d.141)
  %t945 = xor i64 %t944, -9223372036854775808
  %t946 = call i64 @"sx_f64_lt"(i64 %t943, i64 %t945)
  %t947 = icmp ne i64 %t946, 0
  br i1 %t947, label %then57, label %else57
then57:
  %t948 = call i64 @f64_parse(ptr @.str.exp_ns_2d.142)
  %t949 = xor i64 %t948, -9223372036854775808
  store i64 %t949, ptr %local.c.789
  br label %then57_end
then57_end:
  br label %endif57
else57:
  br label %else57_end
else57_end:
  br label %endif57
endif57:
  %t950 = phi i64 [ 0, %then57_end ], [ 0, %else57_end ]
  %t951 = load i64, ptr %local.d.790
  %t952 = call i64 @f64_parse(ptr @.str.exp_ns_2d.143)
  %t953 = call i64 @"sx_f64_gt"(i64 %t951, i64 %t952)
  %t954 = icmp ne i64 %t953, 0
  br i1 %t954, label %then58, label %else58
then58:
  %t955 = call i64 @f64_parse(ptr @.str.exp_ns_2d.144)
  store i64 %t955, ptr %local.d.790
  br label %then58_end
then58_end:
  br label %endif58
else58:
  br label %else58_end
else58_end:
  br label %endif58
endif58:
  %t956 = phi i64 [ 0, %then58_end ], [ 0, %else58_end ]
  %t957 = load i64, ptr %local.d.790
  %t958 = call i64 @f64_parse(ptr @.str.exp_ns_2d.145)
  %t959 = xor i64 %t958, -9223372036854775808
  %t960 = call i64 @"sx_f64_lt"(i64 %t957, i64 %t959)
  %t961 = icmp ne i64 %t960, 0
  br i1 %t961, label %then59, label %else59
then59:
  %t962 = call i64 @f64_parse(ptr @.str.exp_ns_2d.146)
  %t963 = xor i64 %t962, -9223372036854775808
  store i64 %t963, ptr %local.d.790
  br label %then59_end
then59_end:
  br label %endif59
else59:
  br label %else59_end
else59_end:
  br label %endif59
endif59:
  %t964 = phi i64 [ 0, %then59_end ], [ 0, %else59_end ]
  %t965 = load i64, ptr %local.step.791
  %t966 = add i64 %t965, 1
  store i64 %t966, ptr %local.step.791
  br label %loop50
endloop50:
  %t967 = call i64 @f64_parse(ptr @.str.exp_ns_2d.147)
  store i64 %t967, ptr %local.avg_ls.805
  %t968 = call i64 @f64_parse(ptr @.str.exp_ns_2d.148)
  store i64 %t968, ptr %local.avg_sl.806
  %t969 = load i64, ptr %local.count.794
  %t970 = icmp sgt i64 %t969, 0
  %t971 = zext i1 %t970 to i64
  %t972 = icmp ne i64 %t971, 0
  br i1 %t972, label %then60, label %else60
then60:
  %t973 = load i64, ptr %local.sum_ls.792
  %t974 = load i64, ptr %local.count.794
  %t975 = call i64 @"sx_int_to_f64"(i64 %t974)
  %t976 = call i64 @"sx_f64_div"(i64 %t973, i64 %t975)
  store i64 %t976, ptr %local.avg_ls.805
  %t977 = load i64, ptr %local.sum_sl.793
  %t978 = load i64, ptr %local.count.794
  %t979 = call i64 @"sx_int_to_f64"(i64 %t978)
  %t980 = call i64 @"sx_f64_div"(i64 %t977, i64 %t979)
  store i64 %t980, ptr %local.avg_sl.806
  br label %then60_end
then60_end:
  br label %endif60
else60:
  br label %else60_end
else60_end:
  br label %endif60
endif60:
  %t981 = phi i64 [ 0, %then60_end ], [ 0, %else60_end ]
  %t982 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.149)
  %t983 = ptrtoint ptr %t982 to i64
  %t984 = inttoptr i64 %t983 to ptr
  call void @intrinsic_print(ptr %t984)
  %t985 = load i64, ptr %local.nu
  %t986 = call i64 @"print_f64"(i64 %t985)
  %t987 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.150)
  %t988 = ptrtoint ptr %t987 to i64
  %t989 = inttoptr i64 %t988 to ptr
  call void @intrinsic_println(ptr %t989)
  %t990 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.151)
  %t991 = ptrtoint ptr %t990 to i64
  %t992 = inttoptr i64 %t991 to ptr
  call void @intrinsic_print(ptr %t992)
  %t993 = load i64, ptr %local.avg_ls.805
  %t994 = call i64 @"print_f64"(i64 %t993)
  %t995 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.152)
  %t996 = ptrtoint ptr %t995 to i64
  %t997 = inttoptr i64 %t996 to ptr
  call void @intrinsic_println(ptr %t997)
  %t998 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.153)
  %t999 = ptrtoint ptr %t998 to i64
  %t1000 = inttoptr i64 %t999 to ptr
  call void @intrinsic_print(ptr %t1000)
  %t1001 = load i64, ptr %local.avg_sl.806
  %t1002 = call i64 @"print_f64"(i64 %t1001)
  %t1003 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.154)
  %t1004 = ptrtoint ptr %t1003 to i64
  %t1005 = inttoptr i64 %t1004 to ptr
  call void @intrinsic_println(ptr %t1005)
  %t1006 = load i64, ptr %local.avg_ls.805
  %t1007 = call i64 @f64_parse(ptr @.str.exp_ns_2d.155)
  %t1008 = call i64 @"sx_f64_gt"(i64 %t1006, i64 %t1007)
  %t1009 = icmp ne i64 %t1008, 0
  br i1 %t1009, label %then61, label %else61
then61:
  %t1010 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.156)
  %t1011 = ptrtoint ptr %t1010 to i64
  %t1012 = inttoptr i64 %t1011 to ptr
  call void @intrinsic_println(ptr %t1012)
  br label %then61_end
then61_end:
  br label %endif61
else61:
  %t1013 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.157)
  %t1014 = ptrtoint ptr %t1013 to i64
  %t1015 = inttoptr i64 %t1014 to ptr
  call void @intrinsic_println(ptr %t1015)
  br label %else61_end
else61_end:
  br label %endif61
endif61:
  %t1016 = phi i64 [ 0, %then61_end ], [ 0, %else61_end ]
  %t1017 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.158)
  %t1018 = ptrtoint ptr %t1017 to i64
  %t1019 = inttoptr i64 %t1018 to ptr
  call void @intrinsic_println(ptr %t1019)
  ret i64 0
}

define i64 @"test_critical_viscosity"() nounwind {
entry:
  %local.s_high.1020 = alloca i64
  %local.s_low.1021 = alloca i64
  %local.lo.1022 = alloca i64
  %local.hi.1023 = alloca i64
  %local.iter.1024 = alloca i64
  %local.mid.1025 = alloca i64
  %local.s_mid.1026 = alloca i64
  %local.show.1027 = alloca i64
  %local.show3.1028 = alloca i64
  %local.nu_crit.1029 = alloca i64
  %local.re_crit.1030 = alloca i64
  %local.delta.1031 = alloca i64
  %local.s_above.1032 = alloca i64
  %local.s_below.1033 = alloca i64
  %local.ir_above.1034 = alloca i64
  %local.ir_below.1035 = alloca i64
  %t1036 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.159)
  %t1037 = ptrtoint ptr %t1036 to i64
  %t1038 = inttoptr i64 %t1037 to ptr
  call void @intrinsic_println(ptr %t1038)
  %t1039 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.160)
  %t1040 = ptrtoint ptr %t1039 to i64
  %t1041 = inttoptr i64 %t1040 to ptr
  call void @intrinsic_println(ptr %t1041)
  %t1042 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.161)
  %t1043 = ptrtoint ptr %t1042 to i64
  %t1044 = inttoptr i64 %t1043 to ptr
  call void @intrinsic_println(ptr %t1044)
  %t1045 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.162)
  %t1046 = ptrtoint ptr %t1045 to i64
  %t1047 = inttoptr i64 %t1046 to ptr
  call void @intrinsic_println(ptr %t1047)
  %t1048 = call i64 @f64_parse(ptr @.str.exp_ns_2d.163)
  %t1049 = call i64 @"run_2d_sim"(i64 %t1048, i64 1)
  store i64 %t1049, ptr %local.s_high.1020
  %t1050 = call i64 @f64_parse(ptr @.str.exp_ns_2d.164)
  %t1051 = call i64 @"run_2d_sim"(i64 %t1050, i64 1)
  store i64 %t1051, ptr %local.s_low.1021
  %t1052 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.165)
  %t1053 = ptrtoint ptr %t1052 to i64
  %t1054 = inttoptr i64 %t1053 to ptr
  call void @intrinsic_print(ptr %t1054)
  %t1055 = load i64, ptr %local.s_high.1020
  %t1056 = call i64 @"print_f64"(i64 %t1055)
  %t1057 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.166)
  %t1058 = ptrtoint ptr %t1057 to i64
  %t1059 = inttoptr i64 %t1058 to ptr
  call void @intrinsic_println(ptr %t1059)
  %t1060 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.167)
  %t1061 = ptrtoint ptr %t1060 to i64
  %t1062 = inttoptr i64 %t1061 to ptr
  call void @intrinsic_print(ptr %t1062)
  %t1063 = load i64, ptr %local.s_low.1021
  %t1064 = call i64 @"print_f64"(i64 %t1063)
  %t1065 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.168)
  %t1066 = ptrtoint ptr %t1065 to i64
  %t1067 = inttoptr i64 %t1066 to ptr
  call void @intrinsic_println(ptr %t1067)
  %t1068 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.169)
  %t1069 = ptrtoint ptr %t1068 to i64
  %t1070 = inttoptr i64 %t1069 to ptr
  call void @intrinsic_println(ptr %t1070)
  %t1071 = call i64 @f64_parse(ptr @.str.exp_ns_2d.170)
  store i64 %t1071, ptr %local.lo.1022
  %t1072 = call i64 @f64_parse(ptr @.str.exp_ns_2d.171)
  store i64 %t1072, ptr %local.hi.1023
  store i64 0, ptr %local.iter.1024
  %t1073 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.172)
  %t1074 = ptrtoint ptr %t1073 to i64
  %t1075 = inttoptr i64 %t1074 to ptr
  call void @intrinsic_println(ptr %t1075)
  %t1076 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.173)
  %t1077 = ptrtoint ptr %t1076 to i64
  %t1078 = inttoptr i64 %t1077 to ptr
  call void @intrinsic_println(ptr %t1078)
  br label %loop62
loop62:
  %t1079 = load i64, ptr %local.iter.1024
  %t1080 = icmp slt i64 %t1079, 20
  %t1081 = zext i1 %t1080 to i64
  %t1082 = icmp ne i64 %t1081, 0
  br i1 %t1082, label %body62, label %endloop62
body62:
  %t1083 = call i64 @f64_parse(ptr @.str.exp_ns_2d.174)
  %t1084 = load i64, ptr %local.lo.1022
  %t1085 = load i64, ptr %local.hi.1023
  %t1086 = call i64 @"sx_f64_add"(i64 %t1084, i64 %t1085)
  %t1087 = call i64 @"sx_f64_mul"(i64 %t1083, i64 %t1086)
  store i64 %t1087, ptr %local.mid.1025
  %t1088 = load i64, ptr %local.mid.1025
  %t1089 = call i64 @"run_2d_sim"(i64 %t1088, i64 1)
  store i64 %t1089, ptr %local.s_mid.1026
  %t1090 = load i64, ptr %local.iter.1024
  %t1091 = sdiv i64 %t1090, 3
  store i64 %t1091, ptr %local.show.1027
  %t1092 = load i64, ptr %local.show.1027
  %t1093 = mul i64 %t1092, 3
  store i64 %t1093, ptr %local.show3.1028
  %t1094 = load i64, ptr %local.show3.1028
  %t1095 = load i64, ptr %local.iter.1024
  %t1096 = icmp eq i64 %t1094, %t1095
  %t1097 = zext i1 %t1096 to i64
  %t1098 = icmp ne i64 %t1097, 0
  br i1 %t1098, label %then63, label %else63
then63:
  %t1099 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.175)
  %t1100 = ptrtoint ptr %t1099 to i64
  %t1101 = inttoptr i64 %t1100 to ptr
  call void @intrinsic_print(ptr %t1101)
  %t1102 = load i64, ptr %local.iter.1024
  call void @print_i64(i64 %t1102)
  %t1103 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.176)
  %t1104 = ptrtoint ptr %t1103 to i64
  %t1105 = inttoptr i64 %t1104 to ptr
  call void @intrinsic_print(ptr %t1105)
  %t1106 = load i64, ptr %local.lo.1022
  %t1107 = call i64 @"print_f64"(i64 %t1106)
  %t1108 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.177)
  %t1109 = ptrtoint ptr %t1108 to i64
  %t1110 = inttoptr i64 %t1109 to ptr
  call void @intrinsic_print(ptr %t1110)
  %t1111 = load i64, ptr %local.hi.1023
  %t1112 = call i64 @"print_f64"(i64 %t1111)
  %t1113 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.178)
  %t1114 = ptrtoint ptr %t1113 to i64
  %t1115 = inttoptr i64 %t1114 to ptr
  call void @intrinsic_print(ptr %t1115)
  %t1116 = load i64, ptr %local.mid.1025
  %t1117 = call i64 @"print_f64"(i64 %t1116)
  %t1118 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.179)
  %t1119 = ptrtoint ptr %t1118 to i64
  %t1120 = inttoptr i64 %t1119 to ptr
  call void @intrinsic_print(ptr %t1120)
  %t1121 = load i64, ptr %local.s_mid.1026
  %t1122 = call i64 @"print_f64"(i64 %t1121)
  %t1123 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.180)
  %t1124 = ptrtoint ptr %t1123 to i64
  %t1125 = inttoptr i64 %t1124 to ptr
  call void @intrinsic_println(ptr %t1125)
  br label %then63_end
then63_end:
  br label %endif63
else63:
  br label %else63_end
else63_end:
  br label %endif63
endif63:
  %t1126 = phi i64 [ 0, %then63_end ], [ 0, %else63_end ]
  %t1127 = load i64, ptr %local.s_mid.1026
  %t1128 = call i64 @f64_parse(ptr @.str.exp_ns_2d.181)
  %t1129 = call i64 @"sx_f64_gt"(i64 %t1127, i64 %t1128)
  %t1130 = icmp ne i64 %t1129, 0
  br i1 %t1130, label %then64, label %else64
then64:
  %t1131 = load i64, ptr %local.mid.1025
  store i64 %t1131, ptr %local.hi.1023
  br label %then64_end
then64_end:
  br label %endif64
else64:
  %t1132 = load i64, ptr %local.mid.1025
  store i64 %t1132, ptr %local.lo.1022
  br label %else64_end
else64_end:
  br label %endif64
endif64:
  %t1133 = phi i64 [ 0, %then64_end ], [ 0, %else64_end ]
  %t1134 = load i64, ptr %local.hi.1023
  %t1135 = load i64, ptr %local.lo.1022
  %t1136 = call i64 @"sx_f64_sub"(i64 %t1134, i64 %t1135)
  %t1137 = call i64 @f64_parse(ptr @.str.exp_ns_2d.182)
  %t1138 = call i64 @"sx_f64_lt"(i64 %t1136, i64 %t1137)
  %t1139 = icmp ne i64 %t1138, 0
  br i1 %t1139, label %then65, label %else65
then65:
  %t1140 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.183)
  %t1141 = ptrtoint ptr %t1140 to i64
  %t1142 = inttoptr i64 %t1141 to ptr
  call void @intrinsic_print(ptr %t1142)
  %t1143 = load i64, ptr %local.iter.1024
  call void @print_i64(i64 %t1143)
  %t1144 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.184)
  %t1145 = ptrtoint ptr %t1144 to i64
  %t1146 = inttoptr i64 %t1145 to ptr
  call void @intrinsic_print(ptr %t1146)
  %t1147 = load i64, ptr %local.lo.1022
  %t1148 = call i64 @"print_f64"(i64 %t1147)
  %t1149 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.185)
  %t1150 = ptrtoint ptr %t1149 to i64
  %t1151 = inttoptr i64 %t1150 to ptr
  call void @intrinsic_print(ptr %t1151)
  %t1152 = load i64, ptr %local.hi.1023
  %t1153 = call i64 @"print_f64"(i64 %t1152)
  %t1154 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.186)
  %t1155 = ptrtoint ptr %t1154 to i64
  %t1156 = inttoptr i64 %t1155 to ptr
  call void @intrinsic_print(ptr %t1156)
  %t1157 = load i64, ptr %local.mid.1025
  %t1158 = call i64 @"print_f64"(i64 %t1157)
  %t1159 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.187)
  %t1160 = ptrtoint ptr %t1159 to i64
  %t1161 = inttoptr i64 %t1160 to ptr
  call void @intrinsic_print(ptr %t1161)
  %t1162 = load i64, ptr %local.s_mid.1026
  %t1163 = call i64 @"print_f64"(i64 %t1162)
  %t1164 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.188)
  %t1165 = ptrtoint ptr %t1164 to i64
  %t1166 = inttoptr i64 %t1165 to ptr
  call void @intrinsic_println(ptr %t1166)
  store i64 20, ptr %local.iter.1024
  br label %then65_end
then65_end:
  br label %endif65
else65:
  br label %else65_end
else65_end:
  br label %endif65
endif65:
  %t1167 = phi i64 [ 0, %then65_end ], [ 0, %else65_end ]
  %t1168 = load i64, ptr %local.iter.1024
  %t1169 = add i64 %t1168, 1
  store i64 %t1169, ptr %local.iter.1024
  br label %loop62
endloop62:
  %t1170 = call i64 @f64_parse(ptr @.str.exp_ns_2d.189)
  %t1171 = load i64, ptr %local.lo.1022
  %t1172 = load i64, ptr %local.hi.1023
  %t1173 = call i64 @"sx_f64_add"(i64 %t1171, i64 %t1172)
  %t1174 = call i64 @"sx_f64_mul"(i64 %t1170, i64 %t1173)
  store i64 %t1174, ptr %local.nu_crit.1029
  %t1175 = call i64 @f64_parse(ptr @.str.exp_ns_2d.190)
  %t1176 = load i64, ptr %local.nu_crit.1029
  %t1177 = call i64 @"sx_f64_div"(i64 %t1175, i64 %t1176)
  store i64 %t1177, ptr %local.re_crit.1030
  %t1178 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.191)
  %t1179 = ptrtoint ptr %t1178 to i64
  %t1180 = inttoptr i64 %t1179 to ptr
  call void @intrinsic_println(ptr %t1180)
  %t1181 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.192)
  %t1182 = ptrtoint ptr %t1181 to i64
  %t1183 = inttoptr i64 %t1182 to ptr
  call void @intrinsic_print(ptr %t1183)
  %t1184 = load i64, ptr %local.nu_crit.1029
  %t1185 = call i64 @"print_f64"(i64 %t1184)
  %t1186 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.193)
  %t1187 = ptrtoint ptr %t1186 to i64
  %t1188 = inttoptr i64 %t1187 to ptr
  call void @intrinsic_println(ptr %t1188)
  %t1189 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.194)
  %t1190 = ptrtoint ptr %t1189 to i64
  %t1191 = inttoptr i64 %t1190 to ptr
  call void @intrinsic_print(ptr %t1191)
  %t1192 = load i64, ptr %local.re_crit.1030
  %t1193 = call i64 @"print_f64"(i64 %t1192)
  %t1194 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.195)
  %t1195 = ptrtoint ptr %t1194 to i64
  %t1196 = inttoptr i64 %t1195 to ptr
  call void @intrinsic_println(ptr %t1196)
  %t1197 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.196)
  %t1198 = ptrtoint ptr %t1197 to i64
  %t1199 = inttoptr i64 %t1198 to ptr
  call void @intrinsic_println(ptr %t1199)
  %t1200 = call i64 @f64_parse(ptr @.str.exp_ns_2d.197)
  store i64 %t1200, ptr %local.delta.1031
  %t1201 = load i64, ptr %local.nu_crit.1029
  %t1202 = load i64, ptr %local.delta.1031
  %t1203 = call i64 @"sx_f64_add"(i64 %t1201, i64 %t1202)
  %t1204 = call i64 @"run_2d_sim"(i64 %t1203, i64 1)
  store i64 %t1204, ptr %local.s_above.1032
  %t1205 = load i64, ptr %local.nu_crit.1029
  %t1206 = load i64, ptr %local.delta.1031
  %t1207 = call i64 @"sx_f64_sub"(i64 %t1205, i64 %t1206)
  %t1208 = call i64 @"run_2d_sim"(i64 %t1207, i64 1)
  store i64 %t1208, ptr %local.s_below.1033
  %t1209 = load i64, ptr %local.nu_crit.1029
  %t1210 = load i64, ptr %local.delta.1031
  %t1211 = call i64 @"sx_f64_add"(i64 %t1209, i64 %t1210)
  %t1212 = call i64 @"run_2d_sim"(i64 %t1211, i64 0)
  store i64 %t1212, ptr %local.ir_above.1034
  %t1213 = load i64, ptr %local.nu_crit.1029
  %t1214 = load i64, ptr %local.delta.1031
  %t1215 = call i64 @"sx_f64_sub"(i64 %t1213, i64 %t1214)
  %t1216 = call i64 @"run_2d_sim"(i64 %t1215, i64 0)
  store i64 %t1216, ptr %local.ir_below.1035
  %t1217 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.198)
  %t1218 = ptrtoint ptr %t1217 to i64
  %t1219 = inttoptr i64 %t1218 to ptr
  call void @intrinsic_println(ptr %t1219)
  %t1220 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.199)
  %t1221 = ptrtoint ptr %t1220 to i64
  %t1222 = inttoptr i64 %t1221 to ptr
  call void @intrinsic_print(ptr %t1222)
  %t1223 = load i64, ptr %local.s_above.1032
  %t1224 = call i64 @"print_f64"(i64 %t1223)
  %t1225 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.200)
  %t1226 = ptrtoint ptr %t1225 to i64
  %t1227 = inttoptr i64 %t1226 to ptr
  call void @intrinsic_print(ptr %t1227)
  %t1228 = load i64, ptr %local.ir_above.1034
  %t1229 = call i64 @"print_f64"(i64 %t1228)
  %t1230 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.201)
  %t1231 = ptrtoint ptr %t1230 to i64
  %t1232 = inttoptr i64 %t1231 to ptr
  call void @intrinsic_println(ptr %t1232)
  %t1233 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.202)
  %t1234 = ptrtoint ptr %t1233 to i64
  %t1235 = inttoptr i64 %t1234 to ptr
  call void @intrinsic_print(ptr %t1235)
  %t1236 = load i64, ptr %local.s_below.1033
  %t1237 = call i64 @"print_f64"(i64 %t1236)
  %t1238 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.203)
  %t1239 = ptrtoint ptr %t1238 to i64
  %t1240 = inttoptr i64 %t1239 to ptr
  call void @intrinsic_print(ptr %t1240)
  %t1241 = load i64, ptr %local.ir_below.1035
  %t1242 = call i64 @"print_f64"(i64 %t1241)
  %t1243 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.204)
  %t1244 = ptrtoint ptr %t1243 to i64
  %t1245 = inttoptr i64 %t1244 to ptr
  call void @intrinsic_println(ptr %t1245)
  %t1246 = load i64, ptr %local.s_above.1032
  %t1247 = call i64 @f64_parse(ptr @.str.exp_ns_2d.205)
  %t1248 = call i64 @"sx_f64_gt"(i64 %t1246, i64 %t1247)
  %t1249 = icmp ne i64 %t1248, 0
  br i1 %t1249, label %then66, label %else66
then66:
  %t1250 = load i64, ptr %local.s_below.1033
  %t1251 = call i64 @f64_parse(ptr @.str.exp_ns_2d.206)
  %t1252 = call i64 @"sx_f64_le"(i64 %t1250, i64 %t1251)
  %t1253 = icmp ne i64 %t1252, 0
  br i1 %t1253, label %then67, label %else67
then67:
  %t1254 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.207)
  %t1255 = ptrtoint ptr %t1254 to i64
  %t1256 = inttoptr i64 %t1255 to ptr
  call void @intrinsic_println(ptr %t1256)
  br label %then67_end
then67_end:
  br label %endif67
else67:
  %t1257 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.208)
  %t1258 = ptrtoint ptr %t1257 to i64
  %t1259 = inttoptr i64 %t1258 to ptr
  call void @intrinsic_println(ptr %t1259)
  br label %else67_end
else67_end:
  br label %endif67
endif67:
  %t1260 = phi i64 [ 0, %then67_end ], [ 0, %else67_end ]
  br label %then66_end
then66_end:
  br label %endif66
else66:
  %t1261 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.209)
  %t1262 = ptrtoint ptr %t1261 to i64
  %t1263 = inttoptr i64 %t1262 to ptr
  call void @intrinsic_println(ptr %t1263)
  br label %else66_end
else66_end:
  br label %endif66
endif66:
  %t1264 = phi i64 [ %t1260, %then66_end ], [ 0, %else66_end ]
  %t1265 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.210)
  %t1266 = ptrtoint ptr %t1265 to i64
  %t1267 = inttoptr i64 %t1266 to ptr
  call void @intrinsic_println(ptr %t1267)
  %t1268 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.211)
  %t1269 = ptrtoint ptr %t1268 to i64
  %t1270 = inttoptr i64 %t1269 to ptr
  call void @intrinsic_println(ptr %t1270)
  %t1271 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.212)
  %t1272 = ptrtoint ptr %t1271 to i64
  %t1273 = inttoptr i64 %t1272 to ptr
  call void @intrinsic_println(ptr %t1273)
  %t1274 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.213)
  %t1275 = ptrtoint ptr %t1274 to i64
  %t1276 = inttoptr i64 %t1275 to ptr
  call void @intrinsic_println(ptr %t1276)
  %t1277 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.214)
  %t1278 = ptrtoint ptr %t1277 to i64
  %t1279 = inttoptr i64 %t1278 to ptr
  call void @intrinsic_println(ptr %t1279)
  %t1280 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.215)
  %t1281 = ptrtoint ptr %t1280 to i64
  %t1282 = inttoptr i64 %t1281 to ptr
  call void @intrinsic_println(ptr %t1282)
  ret i64 0
}

define i64 @"simplex_main"() nounwind {
entry:
  %t1283 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.216)
  %t1284 = ptrtoint ptr %t1283 to i64
  %t1285 = inttoptr i64 %t1284 to ptr
  call void @intrinsic_println(ptr %t1285)
  %t1286 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.217)
  %t1287 = ptrtoint ptr %t1286 to i64
  %t1288 = inttoptr i64 %t1287 to ptr
  call void @intrinsic_println(ptr %t1288)
  %t1289 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.218)
  %t1290 = ptrtoint ptr %t1289 to i64
  %t1291 = inttoptr i64 %t1290 to ptr
  call void @intrinsic_println(ptr %t1291)
  %t1292 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.219)
  %t1293 = ptrtoint ptr %t1292 to i64
  %t1294 = inttoptr i64 %t1293 to ptr
  call void @intrinsic_println(ptr %t1294)
  %t1295 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.220)
  %t1296 = ptrtoint ptr %t1295 to i64
  %t1297 = inttoptr i64 %t1296 to ptr
  call void @intrinsic_println(ptr %t1297)
  %t1298 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.221)
  %t1299 = ptrtoint ptr %t1298 to i64
  %t1300 = inttoptr i64 %t1299 to ptr
  call void @intrinsic_println(ptr %t1300)
  %t1301 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.222)
  %t1302 = ptrtoint ptr %t1301 to i64
  %t1303 = inttoptr i64 %t1302 to ptr
  call void @intrinsic_println(ptr %t1303)
  %t1304 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.223)
  %t1305 = ptrtoint ptr %t1304 to i64
  %t1306 = inttoptr i64 %t1305 to ptr
  call void @intrinsic_println(ptr %t1306)
  %t1307 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.224)
  %t1308 = ptrtoint ptr %t1307 to i64
  %t1309 = inttoptr i64 %t1308 to ptr
  call void @intrinsic_println(ptr %t1309)
  %t1310 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.225)
  %t1311 = ptrtoint ptr %t1310 to i64
  %t1312 = inttoptr i64 %t1311 to ptr
  call void @intrinsic_println(ptr %t1312)
  %t1313 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.226)
  %t1314 = ptrtoint ptr %t1313 to i64
  %t1315 = inttoptr i64 %t1314 to ptr
  call void @intrinsic_println(ptr %t1315)
  %t1316 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.227)
  %t1317 = ptrtoint ptr %t1316 to i64
  %t1318 = inttoptr i64 %t1317 to ptr
  call void @intrinsic_println(ptr %t1318)
  %t1319 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.228)
  %t1320 = ptrtoint ptr %t1319 to i64
  %t1321 = inttoptr i64 %t1320 to ptr
  call void @intrinsic_println(ptr %t1321)
  %t1322 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.229)
  %t1323 = ptrtoint ptr %t1322 to i64
  %t1324 = inttoptr i64 %t1323 to ptr
  call void @intrinsic_println(ptr %t1324)
  %t1325 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.230)
  %t1326 = ptrtoint ptr %t1325 to i64
  %t1327 = inttoptr i64 %t1326 to ptr
  call void @intrinsic_println(ptr %t1327)
  %t1328 = call i64 @"test_viscosity_sweep"()
  %t1329 = call i64 @"test_energy_cascade"()
  %t1330 = call i64 @"test_critical_viscosity"()
  %t1331 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.231)
  %t1332 = ptrtoint ptr %t1331 to i64
  %t1333 = inttoptr i64 %t1332 to ptr
  call void @intrinsic_println(ptr %t1333)
  %t1334 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.232)
  %t1335 = ptrtoint ptr %t1334 to i64
  %t1336 = inttoptr i64 %t1335 to ptr
  call void @intrinsic_println(ptr %t1336)
  %t1337 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.233)
  %t1338 = ptrtoint ptr %t1337 to i64
  %t1339 = inttoptr i64 %t1338 to ptr
  call void @intrinsic_println(ptr %t1339)
  %t1340 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.234)
  %t1341 = ptrtoint ptr %t1340 to i64
  %t1342 = inttoptr i64 %t1341 to ptr
  call void @intrinsic_println(ptr %t1342)
  %t1343 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.235)
  %t1344 = ptrtoint ptr %t1343 to i64
  %t1345 = inttoptr i64 %t1344 to ptr
  call void @intrinsic_println(ptr %t1345)
  %t1346 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.236)
  %t1347 = ptrtoint ptr %t1346 to i64
  %t1348 = inttoptr i64 %t1347 to ptr
  call void @intrinsic_println(ptr %t1348)
  %t1349 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.237)
  %t1350 = ptrtoint ptr %t1349 to i64
  %t1351 = inttoptr i64 %t1350 to ptr
  call void @intrinsic_println(ptr %t1351)
  %t1352 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.238)
  %t1353 = ptrtoint ptr %t1352 to i64
  %t1354 = inttoptr i64 %t1353 to ptr
  call void @intrinsic_println(ptr %t1354)
  %t1355 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.239)
  %t1356 = ptrtoint ptr %t1355 to i64
  %t1357 = inttoptr i64 %t1356 to ptr
  call void @intrinsic_println(ptr %t1357)
  %t1358 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.240)
  %t1359 = ptrtoint ptr %t1358 to i64
  %t1360 = inttoptr i64 %t1359 to ptr
  call void @intrinsic_println(ptr %t1360)
  %t1361 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.241)
  %t1362 = ptrtoint ptr %t1361 to i64
  %t1363 = inttoptr i64 %t1362 to ptr
  call void @intrinsic_println(ptr %t1363)
  %t1364 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.242)
  %t1365 = ptrtoint ptr %t1364 to i64
  %t1366 = inttoptr i64 %t1365 to ptr
  call void @intrinsic_println(ptr %t1366)
  %t1367 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.243)
  %t1368 = ptrtoint ptr %t1367 to i64
  %t1369 = inttoptr i64 %t1368 to ptr
  call void @intrinsic_println(ptr %t1369)
  %t1370 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.244)
  %t1371 = ptrtoint ptr %t1370 to i64
  %t1372 = inttoptr i64 %t1371 to ptr
  call void @intrinsic_println(ptr %t1372)
  %t1373 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.245)
  %t1374 = ptrtoint ptr %t1373 to i64
  %t1375 = inttoptr i64 %t1374 to ptr
  call void @intrinsic_println(ptr %t1375)
  %t1376 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_2d.246)
  %t1377 = ptrtoint ptr %t1376 to i64
  %t1378 = inttoptr i64 %t1377 to ptr
  call void @intrinsic_println(ptr %t1378)
  ret i64 0
}


; String constants
@.str.exp_ns_2d.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_2d.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_2d.2 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_2d.3 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_2d.4 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_2d.5 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_2d.6 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_2d.7 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_2d.8 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_2d.9 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_2d.10 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_2d.11 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_2d.12 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_2d.13 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_2d.14 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_2d.15 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_ns_2d.16 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_2d.17 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_ns_2d.18 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_ns_2d.19 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_2d.20 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_2d.21 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_2d.22 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_2d.23 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_ns_2d.24 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_2d.25 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_2d.26 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_2d.27 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_2d.28 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_2d.29 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_2d.30 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_2d.31 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_2d.32 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_2d.33 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_2d.34 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_2d.35 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_2d.36 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_2d.37 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_2d.38 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_2d.39 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_2d.40 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_2d.41 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_2d.42 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_2d.43 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_2d.44 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_2d.45 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_2d.46 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_2d.47 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_2d.48 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_2d.49 = private unnamed_addr constant [53 x i8] c"--- Exp 1: Viscosity Sweep (2D Four-Mode System) ---\00"
@.str.exp_ns_2d.50 = private unnamed_addr constant [41 x i8] c"  da/dt = -nu*k1^2*a + alpha*(b*c - b*d)\00"
@.str.exp_ns_2d.51 = private unnamed_addr constant [41 x i8] c"  db/dt = -nu*k1^2*b + alpha*(a*d - a*c)\00"
@.str.exp_ns_2d.52 = private unnamed_addr constant [34 x i8] c"  dc/dt = -nu*k2^2*c + beta*(a*b)\00"
@.str.exp_ns_2d.53 = private unnamed_addr constant [35 x i8] c"  dd/dt = -nu*k2^2*d + beta*(-a*b)\00"
@.str.exp_ns_2d.54 = private unnamed_addr constant [34 x i8] c"  alpha=1.0, beta=0.5, k1=1, k2=2\00"
@.str.exp_ns_2d.55 = private unnamed_addr constant [54 x i8] c"  IC: a=1.0, b=0.5, c=0.1, d=0.1, dt=0.01, 2000 steps\00"
@.str.exp_ns_2d.56 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_2d.57 = private unnamed_addr constant [54 x i8] c"  nu        I_ratio     S_score     Energy      Class\00"
@.str.exp_ns_2d.58 = private unnamed_addr constant [59 x i8] c"  ------    --------    --------    --------    ----------\00"
@.str.exp_ns_2d.59 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_2d.60 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_ns_2d.61 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_2d.62 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_ns_2d.63 = private unnamed_addr constant [5 x i8] c"0.02\00"
@.str.exp_ns_2d.64 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_ns_2d.65 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_2d.66 = private unnamed_addr constant [5 x i8] c"0.15\00"
@.str.exp_ns_2d.67 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_2d.68 = private unnamed_addr constant [5 x i8] c"0.35\00"
@.str.exp_ns_2d.69 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_2d.70 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_2d.71 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_2d.72 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_2d.73 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_2d.74 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_2d.75 = private unnamed_addr constant [5 x i8] c"0.15\00"
@.str.exp_ns_2d.76 = private unnamed_addr constant [12 x i8] c"    LAMINAR\00"
@.str.exp_ns_2d.77 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_2d.78 = private unnamed_addr constant [14 x i8] c"    TURBULENT\00"
@.str.exp_ns_2d.79 = private unnamed_addr constant [17 x i8] c"    TRANSITIONAL\00"
@.str.exp_ns_2d.80 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_2d.81 = private unnamed_addr constant [63 x i8] c"  FINDING: High viscosity damps all modes (laminar, I ~ -0.5).\00"
@.str.exp_ns_2d.82 = private unnamed_addr constant [62 x i8] c"  Low viscosity lets nonlinear coupling dominate (turbulent).\00"
@.str.exp_ns_2d.83 = private unnamed_addr constant [55 x i8] c"  The 2D system shows richer dynamics than 1D Burgers.\00"
@.str.exp_ns_2d.84 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_2d.85 = private unnamed_addr constant [40 x i8] c"--- Exp 2: Energy Cascade Detection ---\00"
@.str.exp_ns_2d.86 = private unnamed_addr constant [55 x i8] c"  Large-scale energy: E_L = a^2 + b^2 (wavenumber k=1)\00"
@.str.exp_ns_2d.87 = private unnamed_addr constant [55 x i8] c"  Small-scale energy: E_S = c^2 + d^2 (wavenumber k=2)\00"
@.str.exp_ns_2d.88 = private unnamed_addr constant [48 x i8] c"  Forward cascade:  energy flows large -> small\00"
@.str.exp_ns_2d.89 = private unnamed_addr constant [63 x i8] c"  Inverse cascade:  energy flows small -> large (2D specialty)\00"
@.str.exp_ns_2d.90 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_2d.91 = private unnamed_addr constant [56 x i8] c"  nu        E_large     E_small     E_L/E_tot   Cascade\00"
@.str.exp_ns_2d.92 = private unnamed_addr constant [59 x i8] c"  ------    --------    --------    --------    ----------\00"
@.str.exp_ns_2d.93 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_2d.94 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_ns_2d.95 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_2d.96 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_ns_2d.97 = private unnamed_addr constant [5 x i8] c"0.02\00"
@.str.exp_ns_2d.98 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_ns_2d.99 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_2d.100 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_2d.101 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_2d.102 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_2d.103 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_ns_2d.104 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_2d.105 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_2d.106 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_2d.107 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_2d.108 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_ns_2d.109 = private unnamed_addr constant [24 x i8] c"    INVERSE / diffusion\00"
@.str.exp_ns_2d.110 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_2d.111 = private unnamed_addr constant [20 x i8] c"    FORWARD cascade\00"
@.str.exp_ns_2d.112 = private unnamed_addr constant [10 x i8] c"    MIXED\00"
@.str.exp_ns_2d.113 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_2d.114 = private unnamed_addr constant [50 x i8] c"  Now: interaction matrix M[large,small] analysis\00"
@.str.exp_ns_2d.115 = private unnamed_addr constant [48 x i8] c"  Rate of energy transfer between scale groups.\00"
@.str.exp_ns_2d.116 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_2d.117 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_ns_2d.118 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_2d.119 = private unnamed_addr constant [62 x i8] c"  FINDING: At low viscosity, nonlinear coupling drives energy\00"
@.str.exp_ns_2d.120 = private unnamed_addr constant [63 x i8] c"  between scales. The direction depends on the mode amplitudes\00"
@.str.exp_ns_2d.121 = private unnamed_addr constant [67 x i8] c"  and coupling structure (alpha, beta). In this 4-mode truncation,\00"
@.str.exp_ns_2d.122 = private unnamed_addr constant [60 x i8] c"  the beta*a*b term couples large to small scales directly.\00"
@.str.exp_ns_2d.123 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_2d.124 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_ns_2d.125 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_2d.126 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_2d.127 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_2d.128 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_2d.129 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_2d.130 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_2d.131 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_2d.132 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_2d.133 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_2d.134 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_2d.135 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_2d.136 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_2d.137 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_2d.138 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_2d.139 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_2d.140 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_2d.141 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_2d.142 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_2d.143 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_2d.144 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_2d.145 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_2d.146 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_2d.147 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_2d.148 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_2d.149 = private unnamed_addr constant [6 x i8] c"  nu=\00"
@.str.exp_ns_2d.150 = private unnamed_addr constant [2 x i8] c":\00"
@.str.exp_ns_2d.151 = private unnamed_addr constant [49 x i8] c"    M[large->small] (avg NL power into small) = \00"
@.str.exp_ns_2d.152 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_2d.153 = private unnamed_addr constant [49 x i8] c"    M[small->large] (avg NL power into large) = \00"
@.str.exp_ns_2d.154 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_2d.155 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_2d.156 = private unnamed_addr constant [52 x i8] c"    => Forward cascade: energy flows large -> small\00"
@.str.exp_ns_2d.157 = private unnamed_addr constant [52 x i8] c"    => Inverse cascade: energy flows small -> large\00"
@.str.exp_ns_2d.158 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_2d.159 = private unnamed_addr constant [44 x i8] c"--- Exp 3: Critical Viscosity Detection ---\00"
@.str.exp_ns_2d.160 = private unnamed_addr constant [50 x i8] c"  Binary search for nu where S transitions + to -\00"
@.str.exp_ns_2d.161 = private unnamed_addr constant [62 x i8] c"  This is the critical viscosity (analogous to 1/Re_critical)\00"
@.str.exp_ns_2d.162 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_2d.163 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_2d.164 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_ns_2d.165 = private unnamed_addr constant [17 x i8] c"  S(nu=0.5)   = \00"
@.str.exp_ns_2d.166 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_2d.167 = private unnamed_addr constant [17 x i8] c"  S(nu=0.001) = \00"
@.str.exp_ns_2d.168 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_2d.169 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_2d.170 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_ns_2d.171 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_2d.172 = private unnamed_addr constant [52 x i8] c"  iter    nu_lo       nu_hi       nu_mid      S_mid\00"
@.str.exp_ns_2d.173 = private unnamed_addr constant [55 x i8] c"  ----    --------    --------    --------    --------\00"
@.str.exp_ns_2d.174 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_2d.175 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_2d.176 = private unnamed_addr constant [8 x i8] c"       \00"
@.str.exp_ns_2d.177 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_2d.178 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_2d.179 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_2d.180 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_2d.181 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_2d.182 = private unnamed_addr constant [7 x i8] c"0.0005\00"
@.str.exp_ns_2d.183 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_2d.184 = private unnamed_addr constant [8 x i8] c"       \00"
@.str.exp_ns_2d.185 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_2d.186 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_2d.187 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_2d.188 = private unnamed_addr constant [14 x i8] c"  (converged)\00"
@.str.exp_ns_2d.189 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_2d.190 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_2d.191 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_2d.192 = private unnamed_addr constant [30 x i8] c"  Critical viscosity: nu_c ~ \00"
@.str.exp_ns_2d.193 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_2d.194 = private unnamed_addr constant [30 x i8] c"  Critical Reynolds:  Re_c ~ \00"
@.str.exp_ns_2d.195 = private unnamed_addr constant [27 x i8] c"  (Re = U*L/nu with U=L=1)\00"
@.str.exp_ns_2d.196 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_2d.197 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_ns_2d.198 = private unnamed_addr constant [38 x i8] c"  Verification around critical point:\00"
@.str.exp_ns_2d.199 = private unnamed_addr constant [20 x i8] c"    nu_c + 0.01: S=\00"
@.str.exp_ns_2d.200 = private unnamed_addr constant [5 x i8] c"  I=\00"
@.str.exp_ns_2d.201 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_2d.202 = private unnamed_addr constant [20 x i8] c"    nu_c - 0.01: S=\00"
@.str.exp_ns_2d.203 = private unnamed_addr constant [5 x i8] c"  I=\00"
@.str.exp_ns_2d.204 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_2d.205 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_2d.206 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_2d.207 = private unnamed_addr constant [56 x i8] c"  >> Confirmed: S flips sign at the critical viscosity.\00"
@.str.exp_ns_2d.208 = private unnamed_addr constant [58 x i8] c"  >> Both positive near boundary (transition is gradual).\00"
@.str.exp_ns_2d.209 = private unnamed_addr constant [57 x i8] c"  >> Transition region: S behaviour near critical point.\00"
@.str.exp_ns_2d.210 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_2d.211 = private unnamed_addr constant [60 x i8] c"  FINDING: The 4-mode system has a critical viscosity where\00"
@.str.exp_ns_2d.212 = private unnamed_addr constant [65 x i8] c"  the S score transitions from positive (laminar, energy decays)\00"
@.str.exp_ns_2d.213 = private unnamed_addr constant [64 x i8] c"  to negative (turbulent, energy grows via nonlinear coupling).\00"
@.str.exp_ns_2d.214 = private unnamed_addr constant [57 x i8] c"  This is the minimal model analogue of the critical Re.\00"
@.str.exp_ns_2d.215 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_2d.216 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_ns_2d.217 = private unnamed_addr constant [52 x i8] c"  2D NAVIER-STOKES DIAGNOSTIC: FOUR-MODE TRUNCATION\00"
@.str.exp_ns_2d.218 = private unnamed_addr constant [44 x i8] c"  I-RATIO AND S SCORE ON VORTICITY DYNAMICS\00"
@.str.exp_ns_2d.219 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_ns_2d.220 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_2d.221 = private unnamed_addr constant [57 x i8] c"  Model: 4 Fourier modes (a,b,c,d) of 2D vorticity field\00"
@.str.exp_ns_2d.222 = private unnamed_addr constant [61 x i8] c"  Modes A,B: large scale (k=1), Modes C,D: small scale (k=2)\00"
@.str.exp_ns_2d.223 = private unnamed_addr constant [43 x i8] c"  Diffusion damps each mode at rate nu*k^2\00"
@.str.exp_ns_2d.224 = private unnamed_addr constant [58 x i8] c"  Nonlinear triad coupling transfers energy between modes\00"
@.str.exp_ns_2d.225 = private unnamed_addr constant [55 x i8] c"  alpha=1.0 (large-scale coupling), beta=0.5 (cascade)\00"
@.str.exp_ns_2d.226 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_2d.227 = private unnamed_addr constant [61 x i8] c"  NOTE: This is a TRUNCATED spectral model (4 DOF), not full\00"
@.str.exp_ns_2d.228 = private unnamed_addr constant [60 x i8] c"  2D NS. It captures the essential physics: energy cascade,\00"
@.str.exp_ns_2d.229 = private unnamed_addr constant [61 x i8] c"  diffusion-nonlinearity competition, and scale interaction.\00"
@.str.exp_ns_2d.230 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_2d.231 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_ns_2d.232 = private unnamed_addr constant [41 x i8] c"  CONCLUSIONS (2D FOUR-MODE TRUNCATION):\00"
@.str.exp_ns_2d.233 = private unnamed_addr constant [55 x i8] c"  1. I-ratio between diffusion and nonlinear 4-vectors\00"
@.str.exp_ns_2d.234 = private unnamed_addr constant [60 x i8] c"     diagnoses flow regime: I ~ -0.5 => balanced => LAMINAR\00"
@.str.exp_ns_2d.235 = private unnamed_addr constant [57 x i8] c"  2. S score tracks energy stability: S > 0 => decaying,\00"
@.str.exp_ns_2d.236 = private unnamed_addr constant [51 x i8] c"     S < 0 => growing (turbulent energy injection)\00"
@.str.exp_ns_2d.237 = private unnamed_addr constant [63 x i8] c"  3. Energy cascade direction visible from interaction matrix:\00"
@.str.exp_ns_2d.238 = private unnamed_addr constant [60 x i8] c"     M[large->small] > 0 => forward, < 0 => inverse cascade\00"
@.str.exp_ns_2d.239 = private unnamed_addr constant [57 x i8] c"  4. Critical viscosity (nu_c) marks the S=0 transition,\00"
@.str.exp_ns_2d.240 = private unnamed_addr constant [47 x i8] c"     analogous to the critical Reynolds number\00"
@.str.exp_ns_2d.241 = private unnamed_addr constant [58 x i8] c"  5. The 2D system shows richer cascade dynamics than 1D:\00"
@.str.exp_ns_2d.242 = private unnamed_addr constant [59 x i8] c"     both forward and inverse energy transfer are possible\00"
@.str.exp_ns_2d.243 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_2d.244 = private unnamed_addr constant [57 x i8] c"  The I-ratio theorem extends naturally to 2D vorticity:\00"
@.str.exp_ns_2d.245 = private unnamed_addr constant [50 x i8] c"  force balance in 4D mode space IS laminar flow.\00"
@.str.exp_ns_2d.246 = private unnamed_addr constant [61 x i8] c"============================================================\00"
